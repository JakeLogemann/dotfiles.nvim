local diag = { data = {}, action = {} }
local buf, win, start_win
local mappings = {
  q = 'close()',
  ['<cr>'] = 'open_and_close()',
  v = 'split("v")',
  s = 'split("")',
  p = 'preview()',
  t = 'open_in_tab()'
}

function diag.action.open()
  local path = vim.api.nvim_get_current_line()

  if vim.api.nvim_win_is_valid(start_win) then
    vim.api.nvim_set_current_win(start_win)
    vim.api.nvim_command('edit ' .. path)
  else
    vim.api.nvim_command('leftabove vsplit ' .. path)
    start_win = vim.api.nvim_get_current_win()
  end
end

function diag.action.close()
  if win and vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_win_close(win, true)
  end
end

function diag.action.open_and_close()
  diag.action.open()
  diag.action.close()
end

function diag.action.preview()
  diag.action.open()
  vim.api.nvim_set_current_win(win)
end

function diag.action.split(axis)
  local path = vim.api.nvim_get_current_line()

  if vim.api.nvim_win_is_valid(start_win) then
    vim.api.nvim_set_current_win(start_win)
    vim.api.nvim_command(axis ..'split ' .. path)
  else
    vim.api.nvim_command('leftabove ' .. axis..'split ' .. path)
  end

  diag.action.close()
end

function diag.action.open_in_tab()
  local path = vim.api.nvim_get_current_line()

  vim.api.nvim_command('tabnew ' .. path)
  diag.action.close()
end

function diag.is_open()
  return win and vim.api.nvim_win_is_valid(win)
end

function diag.focus()
  local cur_win = vim.api.nvim_get_current_win()
  if diag.is_open() and cur_win ~= win then
    vim.api.nvim_set_current_win(win)
  end
end

function diag.create_win()
  -- create a new window instance.
  if not diag.is_open() then
    start_win = vim.api.nvim_get_current_win()

    vim.api.nvim_command('botright vnew')
    win = vim.api.nvim_get_current_win()
    buf = vim.api.nvim_get_current_buf()

    vim.api.nvim_buf_set_name(buf, 'Vimrc Diagnostics')
    vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
    vim.api.nvim_buf_set_option(buf, 'swapfile', false)
    vim.api.nvim_buf_set_option(buf, 'buflisted', false)
    vim.api.nvim_buf_set_option(buf, 'modified', false)
    vim.api.nvim_buf_set_option(buf, 'modifiable', false)
    vim.api.nvim_buf_set_option(buf, 'filetype', 'markdown')
    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    vim.api.nvim_command("setlocal nocursorline nowrap nonu nornu")

    -- automatically delete this buffer when left.
    vim.cmd("autocmd WinLeave <buffer> silent! execute 'bdelete! ".. buf .."'")

    --define mappings from local var at top of this file.
    for keymap,action_fn in pairs(mappings) do
      vim.api.nvim_buf_set_keymap(buf, 'n', keymap, '<cmd>lua vimrc.diags.action.'..action_fn..'<cr>', {
          nowait = true, 
          noremap = true, 
          silent = true,
        })
    end
  end
end

function diag.refresh_data()
  diag.data = {
    "Vimrc Diagnostics", 
    "=================", 
    "",
    string.format("- **Node.js Binary**: `%s`", vim.g.node_host_prog),
    string.format("- **Ruby Binary**: `%s`", vim.g.ruby_host_prog),
    string.format("- **Python3 Binary**: `%s`", vim.g.python3_host_prog),
  }
end

function diag.redraw()
  diag.refresh_data()
  vim.api.nvim_buf_set_option(buf, 'modifiable', true)
  vim.api.nvim_buf_set_lines(buf, 0, 0, true, diag.data)
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
end

function diag.run()
  if diag.is_open() then
    diag.focus()
  else 
    diag.create_win()
  end
  -- lastly, always redraw the window, regardless of if it was created just now.
  diag.redraw()
end

return setmetatable(diag, { __call = function(cls) cls.run() end })
