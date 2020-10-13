local M = {}
local telescope = require('telescope')
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

M.default_theme = themes.get_dropdown({ winblend = 5 })

M.find_files = function() builtin.find_files(M.default_theme) end
M.help_tags = function() builtin.help_tags(M.default_theme) end
M.lsp_references = function() builtin.lsp_references(M.default_theme) end
M.lsp_workspace_symbols = function() builtin.lsp_workspace_symbols(M.default_theme) end
M.lsp_document_symbols = function() builtin.lsp_document_symbols(M.default_theme) end
M.live_grep = function() builtin.live_grep(M.default_theme) end
M.command_history = function() builtin.command_history(M.default_theme) end
M.buffers = function() builtin.buffers(M.default_theme) end

return M
