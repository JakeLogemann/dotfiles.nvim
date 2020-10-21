_G.vimrc.util = (_G.vimrc.util or {})
require('vimrc.util.win')
require('vimrc.util.buf')
_G.vimrc['load'] = require('vimrc.util.load')


_G.vimrc.util.lstriplines = function(s) 
  local ls = pl.stringx.splitlines(s)
  ls = pl.tablex.map(function(li) return pl.stringx.lstrip(li) end, ls)
  return table.concat(ls, "\n") 
end

_G.vimrc.util.bounded = function(value, min, max)
  min = min or 0
  max = max or math.huge

  if min then value = math.max(value, min) end
  if max then value = math.min(value, max) end

  return value
end

_G.vimrc.util.apply_defaults = function(original, defaults)
  if original == nil then
    original = {}
  end

  original = vim.deepcopy(original)

  for k, v in pairs(defaults) do
    if original[k] == nil then
      original[k] = v
    end
  end

  return original
end

function _G.vimrc.util.get_node_at_cursor(cursor)
    if not (vim.g.loaded_nvim_treesitter and vim.g.loaded_nvim_treesitter > 0) then return end
    local parsers = require("nvim-treesitter/parsers")
    if not parsers.has_parser() then return end
    local root = parsers.get_parser():parse():root()
    return root:named_descendant_for_range(cursor[1]-1, cursor[2]-1, cursor[1]-1, cursor[2]-1)
end

function _G.vimrc.util.syntax_at_point(winnr)
    local cursor = vim.api.nvim_win_get_cursor(winnr or 0)

    -- try to get treesitter node type firstly
    local current_node = util.get_node_at_cursor(cursor)
    if current_node then return current_node:type() end
    -- fallback
    return vim.fn.synIDattr(vim.fn.synID(cursor[1], cursor[2], 1), "name")
end

function _G.vimrc.util.Augroup(group, fn)
  vim.api.nvim_command("augroup "..group)
  vim.api.nvim_command("autocmd!")
  fn()
  vim.api.nvim_command("augroup end")
end

function _G.vimrc.util.autodelete_bufnr_on_leave(bufnr)
  -- autocommand to automatically close/delete a buffer when its left.
  vim.cmd("autocmd WinLeave <buffer> silent! execute 'bdelete! ".. bufnr .."'")
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

  buf.make_ephemeral(bufnr)

  -- For better UX we will turn off line wrap and turn on current line highlight.
  vim.api.nvim_win_set_option(winnr, 'wrap', false)
  vim.api.nvim_win_set_option(winnr, 'cursorline', true)

  set_mappings() -- At end we will set mappings for our navigation.
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

return _G.vimrc.util 
