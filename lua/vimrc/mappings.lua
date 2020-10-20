local vimp = require('vimp')
local util = require('vimrc.util')
vimp.unmap_all() -- Remove all previously added maps.
vimp.add_chord_cancellations('n', '<leader>') -- cancel chords when leader is pressed in normal mode.
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
vimp.rbind('nx', opts, {'<leader>e'}, "<cmd>LuaTreeToggle<cr>")
vimp.rbind('nx', opts, {'<leader>ff'}, "<cmd>lua vimrc.find.file()<cr>")
vimp.rbind('nx', opts, {'<leader>fh'}, "<cmd>lua vimrc.find.help_tag()<cr>")
vimp.rbind('nx', opts, {'<leader>fr'}, "<cmd>lua vimrc.find.lsp_reference()<cr>")
vimp.rbind('nx', opts, {'<leader>fs'}, "<cmd>lua vimrc.find.lsp_workspace_symbol()<cr>")
vimp.rbind('nx', opts, {'<leader>fS'}, "<cmd>lua vimrc.find.lsp_document_symbol()<cr>")
vimp.rbind('nx', opts, {'<leader>fg'}, "<cmd>lua vimrc.find.grep()<cr>")
vimp.rbind('nx', opts, {'<leader>fx'}, "<cmd>lua vimrc.find.command()<cr>")
vimp.rbind('nx', opts, {'<leader>fX'}, "<cmd>lua vimrc.find.command_in_history()<cr>")
vimp.rbind('nx', opts, {'<leader>fb'}, "<cmd>lua vimrc.find.buffer()<cr>")
vimp.rbind('nx', opts, {'<leader>fv'}, "<cmd>lua vimrc.find.neovim_config()<cr>")
vimp.rbind('nx', opts, {'<leader>Tn'}, "<cmd>tabNext<cr>")
vimp.rbind('nx', opts, {'<leader>gs'}, "<cmd>Gina status<cr>")
vimp.rbind('nx', opts, {'<leader>gl'}, "<cmd>Gina status<cr>")
vimp.rbind('nx', opts, {'<leader>gC'}, "<cmd>Gina commit<cr>")
vimp.rbind('nx', opts, {'<leader>gB'}, "<cmd>Gina blame<cr>")
vimp.rbind('nx', opts, {'<leader>gb'}, "<cmd>Gina branch<cr>")
vimp.rbind('nx', opts, {'<leader>Tp'}, "<cmd>tabprevious<cr>")
vimp.rbind('nx', opts, {'<leader>Tb'}, "<cmd>lua vimrc.modals.tab_mode()<cr>")
vimp.rbind('nx', opts, {'<leader>bn'}, "<cmd>bNext<cr>")
vimp.rbind('nx', opts, {'<leader>bd'}, "<cmd>bdelete<cr>")
vimp.rbind('nx', opts, {'<leader>bD'}, "<cmd>bdelete!<cr>")
vimp.rbind('nx', opts, {'<leader>bl'}, "<cmd>buffers<cr>")
vimp.rbind('nx', opts, {'<leader>bp'}, "<cmd>bprevious<cr>")
vimp.rbind('nx', opts, {'<leader>bb'}, "<cmd>lua vimrc.modals.buffer_mode()<cr>")
vimp.rbind('nx', opts, {'<leader>zn'}, "<cmd>setl number!<cr>")
vimp.rbind('nx', opts, {'<leader>zw'}, "<cmd>setl wrap!<cr>")
vimp.rbind('nx', opts, {'<leader>zs'}, "<cmd>setl spell!<cr>")
vimp.rbind('nx', opts, {'<leader>zl'}, "<cmd>setl list!<cr>")
vimp.rbind('nx', opts, {'<leader>zm'}, "<cmd>setl mouse!<cr>")
vimp.rbind('nx', opts, {'<leader>zr'}, "<cmd>setl readonly!<cr>")
vimp.rbind('nx', opts, {'<leader>t'}, ':Vista!!<cr>')
vimp.rbind('nx', opts, {'<C-s>'}, ':write<cr>')
vimp.rbind('nx', opts, {'<Esc><Esc>'}, ':noh<cr>')
vimp.rbind('t',  opts, {'<Esc><Esc>'}, '<C-\\><C-n>')
vimp.rbind('nx', opts, {'<leader>r'}, ':ReloadLuaVimrc<cr>')
vimp.rbind('nx', opts, {'<leader>d'}, "<cmd>lua vimrc.diags()<cr>")
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

vimp.nnoremap('<leader>v', function()
  local cur_buf = vim.api.nvim_get_current_buffer()
  dbg(cur_buf)
end)

vim.cmd [[ inoremap <silent><expr> <C-Space> pumvisible() ? "\<C-n>" : completion#trigger_completion() ]]
vim.cmd [[ cnoremap <C-A> <Home> ]] -- start of line.
vim.cmd [[ cnoremap <C-B> <Left> ]] -- back 1 char.
vim.cmd [[ cnoremap <C-D> <Del> ]] -- delete under cursor.
vim.cmd [[ cnoremap <C-E> <End> ]] -- end of line.
vim.cmd [[ cnoremap <C-F> <Right> ]] -- forward 1 char.
vim.cmd [[ cnoremap <C-N> <Down> ]] -- next command in history.
vim.cmd [[ cnoremap <C-P> <Up> ]] -- prev command in history.
vim.cmd [[ cnoremap <Esc><C-B> <S-Left> ]] -- back one word.
vim.cmd [[ cnoremap <Esc><C-F> <S-Right> ]] -- forward one word.

-- vim: ft=lua
