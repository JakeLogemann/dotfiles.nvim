require('vimp') -- vimpeccable, not vim.api
util = require('vimrc.util')

-- Remove all previously added vimpeccable maps
vimp.unmap_all()

-- vimp.rbind('nx', {'<leader>c', 'gc'}, '<plug>Commentary')

-- use Control+{h,j,k,l} to navigate windows.
vimp.rbind('nx', {'<C-j>'}, '<C-w>j')
vimp.rbind('nx', {'<C-k>'}, '<C-w>k')
vimp.rbind('nx', {'<C-h>'}, '<C-w>h')
vimp.rbind('nx', {'<C-l>'}, '<C-w>l')
vimp.rbind('nx', {'<Esc><Esc>'}, ':noh<cr>')
-- vimp.rbind('nx', {'<C-s>'}, ':write<cr>')

-- r = reload vimrc plugin
vimp.nnoremap('<leader>r', function()
  vim.cmd('ReloadLuaVimrc')
end)

-- b = buffer mode
vimp.nnoremap('<leader>b', function()
  require('libmodal').prompt.enter('FOO', {
      ['new']   = 'tabnew',
      ['close'] = 'tabclose',
      ['last']  = 'tablast',
      ['exit'] = libmodal.utils.api.mode_exit
    })
  end)


-- vim: ft=lua
