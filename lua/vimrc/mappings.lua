local vimp = require('vimp') -- vimpeccable, not vim.api
local util = require('vimrc.util')

vimp.rbind('nx', {"override"}, {'<C-j>'}, '<C-w>j')
vimp.rbind('nx', {"override"}, {'<C-k>'}, '<C-w>k')
vimp.rbind('nx', {"override"}, {'<C-h>'}, '<C-w>h')
vimp.rbind('nx', {"override"}, {'<C-l>'}, '<C-w>l')
vimp.rbind('nx', {"override"}, {'<leader>ff'}, "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 5 }))<cr>")
vimp.rbind('nx', {"override"}, {'<leader>fr'}, "<cmd>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_dropdown({ winblend = 5 }))<cr>")
vimp.rbind('nx', {"override"}, {'<leader>fs'}, "<cmd>lua require'telescope.builtin'.lsp_workspace_symbols(require('telescope.themes').get_dropdown({ winblend = 5 }))<cr>")
vimp.rbind('nx', {"override"}, {'<leader>fS'}, "<cmd>lua require'telescope.builtin'.lsp_document_symbols(require('telescope.themes').get_dropdown({ winblend = 5 }))<cr>")
vimp.rbind('nx', {"override"}, {'<leader>fg'}, "<cmd>lua require'telescope.builtin'.live_grep()<cr>")
vimp.rbind('nx', {"override"}, {'<leader>fc'}, "<cmd>lua require'telescope.builtin'.command_history()<cr>")
vimp.rbind('nx', {"override"}, {'<leader>fb'}, "<cmd>lua require'telescope.builtin'.buffers()<cr>")
vimp.rbind('nx', {"override"}, {'<C-s>'}, ':write<cr>')
vimp.rbind('nx', {"override"}, {'<Esc><Esc>'}, ':noh<cr>')
vimp.rbind('t',  {"override"}, {'<Esc><Esc>'}, '<C-\\><C-n>')
vimp.rbind('nx', {"override"}, {'<leader>r'}, ':ReloadLuaVimrc<cr>')

-- b = buffer mode
vimp.nnoremap('<leader>b', function() 
      require('libmodal').mode.enter('BUFFER', {
        ['n']   = 'bNext',
        ['f']   = "<cmd>lua require'telescope.builtin'.buffers()<cr>",
        ['x'] = 'bclose',
        ['p'] = 'bprevious',
        ['c']  = 'enew',
        ['exit'] = libmodal.utils.api.mode_exit
      }) end)


-- vim: ft=lua
