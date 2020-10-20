local pl = require'pl.import_into'()
local log = require'vimrc.vendored.log'
local buf, win, start_win

local lstriplines = function(s) 
  local ls = pl.stringx.splitlines(s)
  ls = pl.tablex.map(function(li) return pl.stringx.lstrip(li) end, ls)
  return table.concat(ls, "\n") 
end

local diag = {}

diag.mappings = {
  q = 'close()',
  Q = 'close()',
  ['<c-c>'] = 'close()',
  ['<cr>'] = 'open_and_close()',
  v = 'split("v")',
  s = 'split("")',
  p = 'preview()',
  t = 'open_in_tab()'
}

-- raw template, after pruning off any leading whitespace.
diag.raw_template = lstriplines([[
    Vimrc Diagnostics
    =================

    - **Node.js Binary**: `$(vim.g.node_host_prog)`
    - **Ruby Binary**: `$(vim.g.ruby_host_prog)`
    - **Python3 Binary**: `$(vim.g.python3_host_prog)`

  ]])
    -- Color Map
    -- ---------
    -- ```lua
    -- $(pl.pretty.write(color_map))
    -- ```

diag.render_template = function()
  local res = pl.template.substitute(diag.raw_template, {
    vim = vim, pl = pl,
    -- color_map = vim.api.nvim_get_color_map(),
  })

  diag.template = res
  return res
end

diag.action = {

  open = function()
    local path = vim.api.nvim_get_current_line()

    if vim.api.nvim_win_is_valid(start_win) then
      vim.api.nvim_set_current_win(start_win)
      vim.api.nvim_command('edit ' .. path)
    else
      vim.api.nvim_command('leftabove vsplit ' .. path)
      start_win = vim.api.nvim_get_current_win()
    end
  end,

  close = function()
    if win and vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end,

  open_and_close = function()
    diag.action.open()
    diag.action.close()
  end,

  preview = function ()
    diag.action.open()
    vim.api.nvim_set_current_win(win)
  end,

  split = function(axis)
    local path = vim.api.nvim_get_current_line()

    if vim.api.nvim_win_is_valid(start_win) then
      vim.api.nvim_set_current_win(start_win)
      vim.api.nvim_command(axis ..'split ' .. path)
    else
      vim.api.nvim_command('leftabove ' .. axis..'split ' .. path)
    end

    diag.action.close()
  end,

  open_in_tab =function ()
    local path = vim.api.nvim_get_current_line()

    vim.api.nvim_command('tabnew ' .. path)
    diag.action.close()
  end,
}

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
    for keymap,action_fn in pairs(diag.mappings) do
      vim.api.nvim_buf_set_keymap(buf, 'n', keymap, '<cmd>lua vimrc.diags.action.'..action_fn..'<cr>', {
          nowait = true, 
          noremap = true, 
          silent = true,
        })
    end
  end
end

function diag.redraw()
  local contents, err = diag.render_template()
  if not err then return pl.utils.raise(err) end
  contents = pl.stringx.splitlines(contents)
  vim.api.nvim_buf_set_option(buf, 'modifiable', true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, true, contents)
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

_G.vimrc.diags = setmetatable(diag, { __call = function(cls) cls.run() end })
