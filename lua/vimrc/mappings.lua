local util = require('vimrc.util')
vimp.unmap_all() -- Remove all previously added maps.
local opts = {"override", "nowait"}
local opts_expr = {"expr", "override", "nowait"}

vimp.rbind('nx', opts, {'<C-j>'}, '<C-w>j')
vimp.rbind('nx', opts, {'<F8>'}, ':sbnext<cr>')
vimp.rbind('nx', opts, {'<S-F8>'}, ':sbprev<cr>')
vimp.rbind('nx', opts, {'<C-k>'}, '<C-w>k')
vimp.rbind('nx', opts, {'<C-s>'}, ':write<cr>')
vimp.rbind('nx', opts, {'<C-h>'}, '<C-w>h')
vimp.rbind('nx', opts, {'<F5>'}, '<cmd>lwindow<cr>')
vimp.rbind('nx', opts, {'<C-l>'}, '<C-w>l')
vimp.rbind('nx', opts, {'<leader>ff'}, "<cmd>lua require'vimrc/plugins/telescope'.find_files()<cr>")
vimp.rbind('nx', opts, {'<leader>fh'}, "<cmd>lua require'vimrc/plugins/telescope'.help_tags()<cr>")
vimp.rbind('nx', opts, {'<leader>fr'}, "<cmd>lua require'vimrc/plugins/telescope'.lsp_references()<cr>")
vimp.rbind('nx', opts, {'<leader>fs'}, "<cmd>lua require'vimrc/plugins/telescope'.lsp_workspace_symbols()<cr>")
vimp.rbind('nx', opts, {'<leader>fS'}, "<cmd>lua require'vimrc/plugins/telescope'.lsp_document_symbols()<cr>")
vimp.rbind('nx', opts, {'<leader>fg'}, "<cmd>lua require'vimrc/plugins/telescope'.live_grep()<cr>")
vimp.rbind('nx', opts, {'<leader>fc'}, "<cmd>lua require'vimrc/plugins/telescope'.command_history()<cr>")
vimp.rbind('nx', opts, {'<leader>fb'}, "<cmd>lua require'vimrc/plugins/telescope'.buffers()<cr>")
vimp.rbind('nx', opts, {'<leader>t'}, ':Vista!!<cr>')
vimp.rbind('nx', opts, {'<C-s>'}, ':write<cr>')
vimp.rbind('nx', opts, {'<Esc><Esc>'}, ':noh<cr>')
vimp.rbind('t',  opts, {'<Esc><Esc>'}, '<C-\\><C-n>')
vimp.rbind('nx', opts, {'<leader>r'}, ':ReloadLuaVimrc<cr>')
vimp.rbind('nx', opts, {'<leader>D'}, "<cmd>lua require('vimrc/diags').new()<cr>")
vimp.rbind('i',  opts_expr, {'<Tab>'}, 'pumvisible() ? "\\<C-n>" : "\\<Tab>"')
vimp.rbind('i',  opts_expr, {'<S-Tab>'}, 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"')
vimp.rbind('i',  opts_expr, {'<C-Space>'}, '<Plug>(completion_trigger)')
vimp.rbind('nx', opts, {'gd'}, "<cmd>lua vim.lsp.buf.declaration()<cr>")
vimp.rbind('nx', opts, {'gD'}, "<cmd>lua vim.lsp.buf.implementation()<cr>")
vimp.rbind('nx', opts, {'K'}, "<cmd>lua vim.lsp.buf.hover()<cr>")
vimp.rbind('nx', opts, {'<C-]>'}, "<cmd>lua vim.lsp.buf.definition()<cr>")
--vimp.rbind('nx', opts, {'<C-k>'}, "<cmd>lua vim.lsp.buf.signature_help()<cr>")
vimp.rbind('nx', opts, {'1gD'}, "<cmd>lua vim.lsp.buf.type_definition()<cr>")
vimp.rbind('nx', opts, {'gr'}, "<cmd>lua vim.lsp.buf.references()<cr>")
vimp.rbind('nx', opts, {'g0'}, "<cmd>lua vim.lsp.buf.document_symbol()<cr>")
vimp.rbind('nx', opts, {'gW'}, "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>")

vimp.nnoremap('<leader>b', function()
      require('libmodal').mode.enter('BUFFER', {
        ['n']   = 'bNext',
        ['f']   = "<cmd>lua require'telescope.builtin'.buffers()<cr>",
        ['x'] = 'bclose',
        ['p'] = 'bprevious',
        ['c']  = 'enew',
        ['exit'] = libmodal.utils.api.mode_exit
      }) end)

vimp.nnoremap('<leader>v', function()
  local cur_buf = vim.api.nvim_get_current_buffer()
  dbg(cur_buf)

  -- vim.api.nvim_open_win(0, false, {
  --   relative='win',
  --   width=12,
  --   height=3,
  --   bufpos={100,10}
  -- })
end)

vim.cmd [[ inoremap <silent><expr> <C-Space> pumvisible() ? "\<C-n>" : completion#trigger_completion() ]]

-- vim: ft=lua
