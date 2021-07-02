local vimrc = _G["vimrc"]

function vimrc.fn.new_win()
  vim.api.nvim_open_win(0, false, {
    relative='win',
    width=12,
    height=3,
    bufpos={100,10}
  })
end

function vimrc.fn.create_win(name)
  -- We save handle to window from which we open the navigation
  start_win = vim.api.nvim_get_current_win()
  vim.api.nvim_command('botright vnew') -- We open a new vertical window at the far right
  winnr = vim.api.nvim_get_current_win() -- We save our navigation window handle...
  bufnr = vim.api.nvim_get_current_buf() -- ...and it's buffer handle.

  -- We should name our buffer. All buffers in vim must have unique names.
  -- The easiest solution will be adding buffer handle to it
  -- because it is already unique and it's just a number.
  vim.api.nvim_buf_set_name(bufnr, name .. '.' .. bufnr)

  vimrc.fn.make_ephemeral_buffer(bufnr)

  -- For better UX we will turn off line wrap and turn on current line highlight.
  vim.api.nvim_win_set_option(winnr, 'wrap', false)
  vim.api.nvim_win_set_option(winnr, 'cursorline', true)
end

-- toggles a named option, outputing its new value for a better UX.
function vimrc.fn.toggle_window_option(option_name)
  local winnr = vim.api.nvim_get_current_win()
  local current = vim.api.nvim_win_get_option(winnr, option_name) or false
  local new_val = not current
  vim.api.nvim_win_set_option(0, option_name, new_val)
  print("SET " .. option_name .. " = " .. (new_val and "ON" or "OFF"))
end

function vimrc.fn.win_is_open(winnr)
    if not winnr then winnr = 0 end
    return vim.api.nvim_win_is_valid(winnr)
end

function vimrc.fn.win_is_current(winnr)
    local cur_win = vim.api.nvim_get_current_win()
    return cur_win == (winnr or 0)
end

function vimrc.fn.win_try_close(winnr)
    if not winnr then winnr = 0 end
    if vim.api.nvim_win_is_valid(winnr) then
      vim.api.nvim_win_close(winnr, true)
    end
end

function vimrc.fn.win_focus(winnr)
  local win = vim.api.nvim_get_current_win()
  if win.is_open(winnr) and not win.is_current(winnr) then
    vim.api.nvim_set_current_win(winnr)
  end
end

