local util = {
  win = require('vimrc.util.win'),
  buf = require('vimrc.util.buf'),
  ['load'] = require('vimrc.util.load'),
}


function util.autodelete_bufnr_on_leave(bufnr)
  -- autocommand to automatically close/delete a buffer when its left.
  vim.cmd("autocmd WinLeave <buffer> silent! execute 'bdelete! ".. bufnr .."'")
end

function util.random_string(length)
  -- generate a random string of arbitrary length.
  if not length or length <= 0 then return '' end
  math.randomseed(os.clock()^5)
  return util.random_string(length - 1) .. charset[math.random(1, #charset)]
end

function util.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

-- Turn some special character value into a character code.
function util.to_char(val) return eval('"\\'..val..'"') end

function util.new_win()
  vim.api.nvim_open_win(0, false, {
    relative='win',
    width=12,
    height=3,
    bufpos={100,10}
  })
end

function util.create_win(name)
  -- We save handle to window from which we open the navigation
  start_win = vim.api.nvim_get_current_win()
  vim.api.nvim_command('botright vnew') -- We open a new vertical window at the far right
  winnr = vim.api.nvim_get_current_win() -- We save our navigation window handle...
  bufnr = vim.api.nvim_get_current_buf() -- ...and it's buffer handle.

  -- We should name our buffer. All buffers in vim must have unique names.
  -- The easiest solution will be adding buffer handle to it
  -- because it is already unique and it's just a number.
  vim.api.nvim_buf_set_name(bufnr, name .. '.' .. bufnr)

  buf.make_ephemeral(bufnr)

  -- For better UX we will turn off line wrap and turn on current line highlight.
  vim.api.nvim_win_set_option(winnr, 'wrap', false)
  vim.api.nvim_win_set_option(winnr, 'cursorline', true)

  set_mappings() -- At end we will set mappings for our navigation.
end


function util.DeepTable()
  local auto, assign

  function auto(tab, key)
    return setmetatable({}, {
        __index = auto,
        __newindex = assign,
        parent = tab,
        key = key
      })
  end

  local meta = {
    __index = auto
  }

  -- The if statement below prevents the table from being
  -- created if the value assigned is nil. This is, I think,
  -- technically correct but it might be desirable to use
  -- assignment to nil to force a table into existence.

  function assign(tab, key, val)
    -- if val ~= nil then
    local oldmt = getmetatable(tab)
    oldmt.parent[oldmt.key] = tab
    setmetatable(tab, meta)
    tab[key] = val
    -- end
  end


  return setmetatable({}, meta)
end

_G.vimrc.util = util
return util 
