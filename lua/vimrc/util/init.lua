_G.vimrc.util = (_G.vimrc.util or {})
_G.vimrc.util['load'] = require('vimrc.util.load')

_G.vimrc.util.lstriplines = function(s)
  local ls = pl.stringx.splitlines(s)
  ls = pl.tablex.map(function(li) return pl.stringx.lstrip(li) end, ls)
  return table.concat(ls, "\n")
end

-- toggles a named option, outputing its new value for a better UX.
--
-- @option_name name of the vim option to be toggled on or off.
_G.vimrc.util.toggle_option = function(option_name)
  local current = vim.api.nvim_get_option(option_name) or false
  local new_val = not current
  vim.api.nvim_set_option(option_name, new_val)
  print("SET " .. option_name .. " = " .. (new_val and "ON" or "OFF"))
end

-- render a penlight template using a standardized context.
--
-- @template text to render with template context
_G.vimrc.util.render_template = function(template)
  return pl.stringx.splitlines(pl.template.substitute(template, {
    vimrc = vimrc,
    vim = vim,
    plenary = require'plenary',
    pl = require'pl',
    icon = require'nvim-web-devicons',
  }))
end

-- bounds given number value between min and max.
--
-- @value target value to modify.
-- @min minimum acceptable value.
-- @max maximum acceptable value.
_G.vimrc.util.bounded = function(value, min, max)
  min = min or 0
  max = max or math.huge

  if min then value = math.max(value, min) end
  if max then value = math.min(value, max) end

  return value
end

-- applys defaults to a given table.
--
-- @original table to inject defaults into.
-- @defaults default values to inject into target table
_G.vimrc.util.apply_defaults = function(original, defaults)
  if original == nil then original = {} end
  original = vim.deepcopy(original)

  for k, v in pairs(defaults) do
    if original[k] == nil then original[k] = v end
  end

  return original
end

function _G.vimrc.util.Augroup(group, fn)
  vim.api.nvim_command("augroup "..group)
  vim.api.nvim_command("autocmd!")
  fn()
  vim.api.nvim_command("augroup end")
end

function _G.vimrc.util.random_string(length)
  -- generate a random string of arbitrary length.
  if not length or length <= 0 then return '' end
  math.randomseed(os.clock()^5)
  return util.random_string(length - 1) .. charset[math.random(1, #charset)]
end

function _G.vimrc.util.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

-- Turn some special character value into a character code.
function _G.vimrc.util.to_char(val) return eval('"\\'..val..'"') end

function _G.vimrc.util.new_win()
  vim.api.nvim_open_win(0, false, {
    relative='win',
    width=12,
    height=3,
    bufpos={100,10}
  })
end

function _G.vimrc.util.create_win(name)
  -- We save handle to window from which we open the navigation
  start_win = vim.api.nvim_get_current_win()
  vim.api.nvim_command('botright vnew') -- We open a new vertical window at the far right
  winnr = vim.api.nvim_get_current_win() -- We save our navigation window handle...
  bufnr = vim.api.nvim_get_current_buf() -- ...and it's buffer handle.

  -- We should name our buffer. All buffers in vim must have unique names.
  -- The easiest solution will be adding buffer handle to it
  -- because it is already unique and it's just a number.
  vim.api.nvim_buf_set_name(bufnr, name .. '.' .. bufnr)

  require'vimrc.util.buf'.make_ephemeral(bufnr)

  -- For better UX we will turn off line wrap and turn on current line highlight.
  vim.api.nvim_win_set_option(winnr, 'wrap', false)
  vim.api.nvim_win_set_option(winnr, 'cursorline', true)
end


function _G.vimrc.util.DeepTable()
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

require('vimrc.util.win')
require('vimrc.util.buf')
return _G.vimrc.util 
