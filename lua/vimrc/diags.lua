local api = vim.api -- luacheck: ignore
local buf, win, start_win
local mappings = {
  q = 'close()',
  ['<cr>'] = 'open_and_close()',
  v = 'split("v")',
  s = 'split("")',
  p = 'preview()',
  t = 'open_in_tab()'
}

local function open()
  local path = api.nvim_get_current_line()

  if api.nvim_win_is_valid(start_win) then
    api.nvim_set_current_win(start_win)
    api.nvim_command('edit ' .. path)
  else
    api.nvim_command('leftabove vsplit ' .. path)
    start_win = api.nvim_get_current_win()
  end
end

local function close()
  if win and api.nvim_win_is_valid(win) then
    api.nvim_win_close(win, true)
  end
end

local function open_and_close()
  open()
  close()
end

local function preview()
  open()
  api.nvim_set_current_win(win)
end

local function split(axis)
  local path = api.nvim_get_current_line()

  if api.nvim_win_is_valid(start_win) then
    api.nvim_set_current_win(start_win)
    api.nvim_command(axis ..'split ' .. path)
  else
    api.nvim_command('leftabove ' .. axis..'split ' .. path)
  end

  close()
end

local function open_in_tab()
  local path = api.nvim_get_current_line()

  api.nvim_command('tabnew ' .. path)
  close()
end


local function redraw()
  api.nvim_buf_set_option(buf, 'modifiable', true)
  api.nvim_buf_set_lines(buf, 0, -1, false, {
    "Vimrc Diagnostics", "=================", "",
    string.format("- **Node.js Binary**: `%s`", vim.g.node_host_prog),
    string.format("- **Ruby Binary**: `%s`", vim.g.ruby_host_prog),
    string.format("- **Python3 Binary**: `%s`", vim.g.python3_host_prog),
    "NeoVim Options", 
    "--------------", 
    "```", string.format("%s",vim.inspect(vim.o)), "```",
  })
  api.nvim_buf_set_option(buf, 'modifiable', false)
end

local function new()
  if win and api.nvim_win_is_valid(win) then
    api.nvim_set_current_win(win)
  else -- create a new window instance.
    start_win = api.nvim_get_current_win()

    api.nvim_command('botright vnew')
    win = api.nvim_get_current_win()
    buf = api.nvim_get_current_buf()

    api.nvim_buf_set_name(0, 'Vimrc Diagnostics')
    api.nvim_buf_set_option(0, 'buftype', 'nofile')
    api.nvim_buf_set_option(0, 'swapfile', false)
    api.nvim_buf_set_option(0, 'buflisted', false)
    api.nvim_buf_set_option(0, 'modified', false)
    api.nvim_buf_set_option(0, 'modifiable', false)
    api.nvim_buf_set_option(0, 'filetype', 'markdown')
    api.nvim_buf_set_option(0, 'bufhidden', 'wipe')
    api.nvim_command("setlocal nocursorline nowrap nonu nornu")

    --define mappings from local var at top of this file.
    for keymap,action_fn in pairs(mappings) do
      api.nvim_buf_set_keymap(buf, 'n', keymap, 
        ':lua require"vimrc/diags".action.'..action_fn..'<cr>', {
          nowait = true, 
          noremap = true, 
          silent = true,
        })
    end
  end
  -- lastly, always redraw the window, regardless of if it was created just now.
  redraw()
end


return {
  new = new,
  action = {
    close = close,
    open_and_close = open_and_close,
    preview = preview,
    open_in_tab = open_in_tab,
    split = split,
  },
}
