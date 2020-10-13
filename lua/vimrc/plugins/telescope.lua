package.loaded['vimrc.plugins.telescope'] = nil

local M = {}
local finders = {}
local telescope = require('telescope')
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

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
finders.find_files = function() builtin.find_files({}) end
finders.help_tags = function() builtin.help_tags({show_version = true}) end
finders.lsp_references = function() builtin.lsp_references({}) end
finders.lsp_workspace_symbols = function() builtin.lsp_workspace_symbols({}) end
finders.oldfiles = function() builtin.oldfiles({}) end
finders.lsp_document_symbols = function() builtin.lsp_document_symbols({}) end
finders.live_grep = function() builtin.live_grep({ shorten_path = true }) end
finders.current_buffer_fuzzy_find = function() builtin.current_buffer_fuzzy_find({}) end
finders.command_history = function() builtin.command_history({}) end
finders.buffers = function() builtin.buffers({}) end

--
-- custom finders
--

finders.git_repo = function()
  builtin.find_files {
    previewer = false,
    layout_strategy = "vertical",
    cwd = require('nvim_lsp.util').root_pattern(".git")(vim.fn.expand("%:p")),
  }
end

finders.open_neovim_config = function()
  builtin.git_files {
    previewer = false,
    shorten_path = false,
    cwd = vim.fn.stdpath('config'),
    prompt = "NeoVim Configuration Files",
    height = 10,
  }
end

finders.search_project_root = function()
  builtin.find_files {
    previewer = false,
    layout_strategy = "vertical",
    cwd = require('nvim_lsp.util').root_pattern(".git")(vim.fn.expand("%:p")),
  }
end

---
-- Final Module Initialization & Return
---
M.finder_names = vim.tbl_keys(finders)
return vim.tbl_extend("keep", M, finders)
