local util = require('vimrc.util')
vimp.unmap_all() -- Remove all previously added maps.

vimp.rbind('nx', {"override"}, {'<C-j>'}, '<C-w>j')
vimp.rbind('nx', {"override"}, {'<F8>'}, ':sbnext<cr>')
vimp.rbind('nx', {"override"}, {'<S-F8>'}, ':sbprev<cr>')
vimp.rbind('nx', {"override"}, {'<C-k>'}, '<C-w>k')
vimp.rbind('nx', {"override"}, {'<C-s>'}, ':write<cr>')
vimp.rbind('nx', {"override"}, {'<C-h>'}, '<C-w>h')
vimp.rbind('nx', {"override"}, {'<C-l>'}, '<C-w>l')
vimp.rbind('nx', {"override"}, {'<leader>ff'}, "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 5 }))<cr>")
vimp.rbind('nx', {"override"}, {'<leader>fr'}, "<cmd>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_dropdown({ winblend = 5 }))<cr>")
vimp.rbind('nx', {"override"}, {'<leader>fs'}, "<cmd>lua require'telescope.builtin'.lsp_workspace_symbols(require('telescope.themes').get_dropdown({ winblend = 5 }))<cr>")
vimp.rbind('nx', {"override"}, {'<leader>fS'}, "<cmd>lua require'telescope.builtin'.lsp_document_symbols(require('telescope.themes').get_dropdown({ winblend = 5 }))<cr>")
vimp.rbind('nx', {"override"}, {'<leader>fg'}, "<cmd>lua require'telescope.builtin'.live_grep()<cr>")
vimp.rbind('nx', {"override"}, {'<leader>fc'}, "<cmd>lua require'telescope.builtin'.command_history()<cr>")
vimp.rbind('nx', {"override"}, {'<leader>fb'}, "<cmd>lua require'telescope.builtin'.buffers()<cr>")
vimp.rbind('nx', {"override","silent"}, {'<leader>t'}, ':Vista!!<cr>')
vimp.rbind('nx', {"override"}, {'<C-s>'}, ':write<cr>')
vimp.rbind('nx', {"override"}, {'<Esc><Esc>'}, ':noh<cr>')
vimp.rbind('t',  {"override"}, {'<Esc><Esc>'}, '<C-\\><C-n>')
vimp.rbind('nx', {"override"}, {'<leader>r'}, ':ReloadLuaVimrc<cr>')

vimp.rbind('nx', {"override"}, {'gd'}, "<cmd>lua vim.lsp.buf.declaration()<cr>")
vimp.rbind('nx', {"override"}, {'gD'}, "<cmd>lua vim.lsp.buf.implementation()<cr>")
vimp.rbind('nx', {"override"}, {'K'}, "<cmd>lua vim.lsp.buf.hover()<cr>")
vimp.rbind('nx', {"override"}, {'<C-]>'}, "<cmd>lua vim.lsp.buf.definition()<cr>")
--vimp.rbind('nx', {"override"}, {'<C-k>'}, "<cmd>lua vim.lsp.buf.signature_help()<cr>")
vimp.rbind('nx', {"override"}, {'1gD'}, "<cmd>lua vim.lsp.buf.type_definition()<cr>")
vimp.rbind('nx', {"override"}, {'gr'}, "<cmd>lua vim.lsp.buf.references()<cr>")
vimp.rbind('nx', {"override"}, {'g0'}, "<cmd>lua vim.lsp.buf.document_symbol()<cr>")
vimp.rbind('nx', {"override"}, {'gW'}, "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>")

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
