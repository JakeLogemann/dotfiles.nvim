local vimrc = _G["vimrc"]

function vimrc.fn.preview_markdown(name, template)
  -- We save handle to window from which we open the navigation
  local start_win = vim.api.nvim_get_current_win()
  vim.api.nvim_command('botright vnew') -- We open a new vertical window at the far right
  local winnr = vim.api.nvim_get_current_win() -- We save our navigation window handle...
  local bufnr = vim.api.nvim_get_current_buf() -- ...and it's buffer handle.

  local res = vimrc.fn.render_template(template)

  vim.api.nvim_buf_set_name(bufnr, name..'.'..bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'filetype', 'markdown')
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, res)
  vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)

  -- make buffer ephermeral
  vimrc.fn.make_ephemeral_buffer(winnr, bufnr)
  vimrc.fn.disable_buffer_extras(winnr, bufnr)
  vim.cmd("autocmd WinLeave <buffer> silent! execute 'bdelete! ".. bufnr .."'")
end
