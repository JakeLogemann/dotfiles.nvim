local win = {}

-- toggles a named option, outputing its new value for a better UX.
function win.toggle_option(option_name)
  local winnr = vim.api.nvim_get_current_win()
  local current = vim.api.nvim_win_get_option(winnr, option_name) or false
  local new_val = not current
  vim.api.nvim_win_set_option(0, option_name, new_val)
  print("SET " .. option_name .. " = " .. (new_val and "ON" or "OFF"))
end

function win.is_open(winnr)
    if not winnr then winnr = 0 end
    return vim.api.nvim_win_is_valid(winnr)
end

function win.is_current(winnr)
    local cur_win = vim.api.nvim_get_current_win()
    return cur_win == (winnr or 0)
end

function win.try_close(winnr)
    if not winnr then winnr = 0 end
    if vim.api.nvim_win_is_valid(winnr) then
      vim.api.nvim_win_close(winnr, true)
    end
end

function win.focus(winnr)
  if win.is_open(winnr) and not win.is_current(winnr) then
    vim.api.nvim_set_current_win(winnr)
  end
end

function win.ephemeral_markdown(name, template)
  -- We save handle to window from which we open the navigation
  local start_win = vim.api.nvim_get_current_win()
  vim.api.nvim_command('botright vnew') -- We open a new vertical window at the far right
  local winnr = vim.api.nvim_get_current_win() -- We save our navigation window handle...
  local bufnr = vim.api.nvim_get_current_buf() -- ...and it's buffer handle.

  local res = require'vimrc.util'.render_template(template)

  vim.api.nvim_buf_set_name(bufnr, name..'.'..bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'filetype', 'markdown')
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, res)
  vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)

  -- make buffer ephermeral
  require'vimrc.util.buf'.make_ephemeral(winnr, bufnr)
  require'vimrc.util.buf'.disable_extras(winnr, bufnr)
  vim.cmd("autocmd WinLeave <buffer> silent! execute 'bdelete! ".. bufnr .."'")
end

_G.vimrc.util.win = win

