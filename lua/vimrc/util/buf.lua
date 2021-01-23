local BUF = {}

-- toggles a named option, outputing its new value for a better UX.
function BUF.toggle_option(option_name)
  local bufnr = vim.api.nvim_get_current_buf()
  local current = vim.api.nvim_buf_get_option(bufnr, option_name) or false
  local new_val = not current
  vim.api.nvim_buf_set_option(0, option_name, new_val)
  print("SET " .. option_name .. " = " .. (new_val and "ON" or "OFF"))
end

function BUF.make_ephemeral(winnr, bufnr)
  BUF.disable_extras(winnr, bufnr)
  -- do not list this buffer for selection:
  vim.api.nvim_buf_set_option(bufnr, 'buflisted', false)
  -- do not persist a swapfile for this buffer:
  vim.api.nvim_buf_set_option(bufnr, 'swapfile', false)
  -- remove the buffer when it is hidden:
  vim.api.nvim_buf_set_option(bufnr, 'bufhidden', 'wipe')
  -- buftype=nofile prevents marking buffers as not being backed by a real file, so
  -- theres no need to save.
  -- vim.api.nvim_buf_set_option(bufnr, 'buftype', 'nofile')
  -- destroy this buffer automaticaly when its left.
  vim.cmd("autocmd WinLeave,BufLeave <buffer> silent! execute 'bwipeout!'")
end


function BUF.disable_extras(winnr, bufnr)
  vim.api.nvim_win_set_option(bufnr, 'cursorline', true)
  vim.api.nvim_win_set_option(bufnr, 'number', false)
  vim.api.nvim_win_set_option(bufnr, 'wrap', false)
end

function BUF.autodelete_on_leave(bufnr)
  -- autocommand to automatically close/delete a buffer when its left.
  vim.cmd("autocmd WinLeave <buffer> silent! execute 'bwipe! ".. bufnr .."'")
end

_G.vimrc.util.buf = BUF

