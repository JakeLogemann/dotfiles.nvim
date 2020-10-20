local BUF = {}

function BUF.make_ephemeral(bufnr)
  -- Now we set some options for our buffer.
  -- nofile prevent mark buffer as modified so we never get warnings about not saved changes.
  -- Also some plugins treat nofile buffers different.  For example coc.nvim don't triggers
  -- aoutcompletation for these.
  vim.api.nvim_buf_set_option(bufnr, 'buftype', 'nofile')
  -- We do not need swapfile, backup, etc.
  vim.api.nvim_buf_set_option(bufnr, 'swapfile', false)
  vim.api.nvim_buf_set_option(bufnr, 'backup', false)
  -- And we would rather prefer that buffer will be destroyed when hide.
  vim.api.nvim_buf_set_option(bufnr, 'bufhidden', 'wipe')
  -- For better UX we will turn off line wrap and turn on current line highlight.
  vim.api.nvim_buf_set_option(bufnr, 'wrap', false)
  vim.api.nvim_buf_set_option(bufnr, 'cursorline', true)
end


function BUF.autodelete_on_leave(bufnr)
  -- autocommand to automatically close/delete a buffer when its left.
  vim.cmd("autocmd WinLeave <buffer> silent! execute 'bdelete! ".. bufnr .."'")
end



return BUF

