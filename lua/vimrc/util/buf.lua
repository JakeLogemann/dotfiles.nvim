local BUF = {}

-- toggles a named option, outputing its new value for a better UX.
function BUF.toggle_option(option_name)
  local current = (vim.bo[option_name] or false)
  local new_val = not current
  vim.api.nvim_buf_set_option(0, option_name, new_val)
  print("SET " .. option_name .. " = " .. new_val)
end

function BUF.make_ephemeral(winnr, bufnr)
  -- Now we set some options for our buffer.
  -- nofile prevent mark buffer as modified so we never get warnings about not saved changes.
  -- Also some plugins treat nofile buffers different.  For example coc.nvim don't triggers
  -- aoutcompletation for these.
  vim.api.nvim_buf_set_option(bufnr, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(bufnr, 'buflisted', false)
  vim.api.nvim_buf_set_option(bufnr, 'modified', false)
  -- We do not need swapfile, backup, etc.
  vim.api.nvim_buf_set_option(bufnr, 'swapfile', false)
  -- And we would rather prefer that buffer will be destroyed when hide.
  vim.api.nvim_buf_set_option(bufnr, 'bufhidden', 'wipe')
  -- For better UX we will turn off line wrap and turn on current line highlight.
  vim.api.nvim_win_set_option(winnr, 'wrap', false)
  vim.api.nvim_win_set_option(winnr, 'cursorline', true)
  vim.api.nvim_win_set_option(winnr, 'number', true)
end


function BUF.autodelete_on_leave(bufnr)
  -- autocommand to automatically close/delete a buffer when its left.
  vim.cmd("autocmd WinLeave <buffer> silent! execute 'bdelete! ".. bufnr .."'")
end

_G.vimrc.util.buf = BUF

