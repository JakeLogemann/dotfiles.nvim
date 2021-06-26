paq "nvim-lua/telescope.nvim"

_G["telescope"]      = require('telescope')
telescope.actions    = require('telescope.actions')
telescope.builtin    = require('telescope.builtin')
telescope.conf       = require('telescope.config').values
telescope.finders    = require('telescope.finders')
telescope.make_entry = require('telescope.make_entry')
telescope.pickers    = require('telescope.pickers')
telescope.previewers = require('telescope.previewers')
telescope.sorters    = require('telescope.sorters')
telescope.themes     = require('telescope.themes')
telescope.utils      = require('telescope.utils')

local find = { telescope = telescope; }

find._setup = function()
  telescope.setup {
    defaults = telescope.themes.get_dropdown ({
      winblend = 5,
      layout_strategy = "horizontal",
      preview_cutoff = 120,
      layout_options = { preview_width = 0.75 },
      sorting_strategy = "ascending",
      prompt_position = "top",
      border = true,
      -- borderchars = {{ '─', '│', '─', '│', '╭', '╮', '╯', '╰'}, preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},},
    })
  }

  find._names = vim.tbl_keys(find) -- creates a cache of the finder names.
  vimrc.find = find  -- can be found globally under vimrc.find.
  return find  -- can still be loaded directly from file.
end

--
-- upstream builtin finders
--
function find.buffer() telescope.builtin.buffers({}) end
function find.buffer_line() telescope.builtin.current_buffer_fuzzy_find({}) end
function find.document_symbol() telescope.builtin.lsp_document_symbols({}) end
function find.file() telescope.builtin.find_files({}) end
function find.grep() telescope.builtin.live_grep({ shorten_path = true }) end
function find.help() telescope.builtin.help_tags({show_version = true}) end
function find.recent_command() telescope.builtin.command_history({}) end
function find.recent_file() telescope.builtin.oldfiles({}) end
function find.reference() telescope.builtin.lsp_references({}) end
function find.workspace_symbol() telescope.builtin.lsp_workspace_symbols({}) end

--
-- custom finders
--

find.git_repo = function()
  telescope.builtin.find_files {
    previewer = false,
    layout_strategy = "vertical",
    cwd = require('nvim_lsp.util').root_pattern(".git")(vim.fn.expand("%:p")),
  }
end

find.neovim_config = function()
  telescope.builtin.git_files {
    previewer = false,
    shorten_path = false,
    cwd = vim.fn.stdpath('config'),
    prompt = "NeoVim Configuration Files",
    height = 10,
  }
end

find.search_project_root = function()
  telescope.builtin.find_files {
    previewer = false,
    layout_strategy = "vertical",
    cwd = require('nvim_lsp.util').root_pattern(".git")(vim.fn.expand("%:p")),
  }
end

find.command = function()
  telescope.pickers.new({}, {
    prompt = 'Commands',
    finder = telescope.finders.new_table {
      results = (function()
        local command_iter = vim.api.nvim_get_commands({})
        local commands = {}

        for _, cmd in pairs(command_iter) do
          table.insert(commands, cmd)
        end

        return commands
      end)(),
      entry_maker = function(line)
        return {
          valid = line ~= "",
          value = line,
          ordinal = line.name,
          display = line.name
        }
      end
    },
    sorter = telescope.sorters.get_generic_fuzzy_sorter(),
    attach_mappings = function(prompt_bufnr, map)
      local run_command = function()
        local selection = telescope.actions.get_selected_entry(prompt_bufnr)
        telescope.actions.close(prompt_bufnr)
        local val = selection.value
        local cmd = string.format([[:%s ]], val.name)

        if val.nargs == "0" then
            vim.cmd(cmd)
        else
            vim.cmd [[stopinsert]]
            vim.fn.feedkeys(cmd)
        end

      end

      map('i', '<CR>', run_command)
      map('n', '<CR>', run_command)

      return true
    end
  }):find()
end

-- Finally, Initialization & Return
return find._setup()  -- can still be loaded directly from file.
