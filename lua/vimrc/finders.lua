local M = {}
local actions    = require('telescope.actions')
local builtin    = require('telescope.builtin')
local conf       = require('telescope.config').values
local finders    = require('telescope.finders')
local make_entry = require('telescope.make_entry')
local pickers    = require('telescope.pickers')
local previewers = require('telescope.previewers')
local sorters    = require('telescope.sorters')
local telescope  = require('telescope')
local themes     = require('telescope.themes')
local utils      = require('telescope.utils')
local filter = vim.tbl_filter
local flatten = vim.tbl_flatten


telescope.setup {
  defaults = themes.get_dropdown ({
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

--
-- upstream builtin finders
--
M.file = function() builtin.find_files({}) end
M.help_tag = function() builtin.help_tags({show_version = true}) end
M.lsp_reference = function() builtin.lsp_references({}) end
M.lsp_workspace_symbol = function() builtin.lsp_workspace_symbols({}) end
M.recent_file = function() builtin.oldfiles({}) end
M.lsp_document_symbol = function() builtin.lsp_document_symbols({}) end
M.grep = function() builtin.live_grep({ shorten_path = true }) end
M.current_buffer_line = function() builtin.current_buffer_fuzzy_find({}) end
M.command_in_history = function() builtin.command_history({}) end
M.buffer = function() builtin.buffers({}) end

--
-- custom finders
--

M.git_repo = function()
  builtin.find_files {
    previewer = false,
    layout_strategy = "vertical",
    cwd = require('nvim_lsp.util').root_pattern(".git")(vim.fn.expand("%:p")),
  }
end

M.neovim_config = function()
  builtin.git_files {
    previewer = false,
    shorten_path = false,
    cwd = vim.fn.stdpath('config'),
    prompt = "NeoVim Configuration Files",
    height = 10,
  }
end

M.search_project_root = function()
  builtin.find_files {
    previewer = false,
    layout_strategy = "vertical",
    cwd = require('nvim_lsp.util').root_pattern(".git")(vim.fn.expand("%:p")),
  }
end

M.command = function()
  pickers.new({}, {
    prompt = 'Commands',
    finder = finders.new_table {
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
    sorter = sorters.get_generic_fuzzy_sorter(),
    attach_mappings = function(prompt_bufnr, map)
      local run_command = function()
        local selection = actions.get_selected_entry(prompt_bufnr)
        actions.close(prompt_bufnr)
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

---
-- Final Module Initialization & Return
---
M.finder_names = vim.tbl_keys(M)
_G.vimrc.finders = M
return M
