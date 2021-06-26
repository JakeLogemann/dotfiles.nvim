local vimrc = _G["vimrc"]
vimrc.fn = {}

function vimrc.fn.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

-- bounds given number value between min and max.
--
-- @value target value to modify.
-- @min minimum acceptable value.
-- @max maximum acceptable value.
vimrc.fn.bounded = function(value, min, max)
  min = min or 0
  max = max or math.huge

  if min then value = math.max(value, min) end
  if max then value = math.min(value, max) end

  return value
end

require('vimrc/fn/api')
require('vimrc/fn/autocmd')
require('vimrc/fn/buffer')
require('vimrc/fn/diag')
require('vimrc/fn/load')
require('vimrc/fn/option')
require('vimrc/fn/preview')
require('vimrc/fn/popup')
require('vimrc/fn/string')
require('vimrc/fn/syntax')
require('vimrc/fn/table')
require('vimrc/fn/template')
require('vimrc/fn/window')

function vimrc.fn.reload()
  if     vim.fn.has("mac")   == 1 then vimrc.os_family = "macOS"
  elseif vim.fn.has("unix")  == 1 then vimrc.os_family = "Linux"
  elseif vim.fn.has('win32') == 1 then vimrc.os_family = "Windows"
  else vimrc.os_family = "Unsupported" end

  -- set all opts in neovim.
  if vimrc and vimrc.opts then
    for k, v in pairs(vimrc.opts.g)   do vim.g[k]   = v end
    for k, v in pairs(vimrc.opts.o)   do vim.o[k]   = v end
    for k, v in pairs(vimrc.opts.t)   do vim.t[k]   = v end
    for k, v in pairs(vimrc.opts.env) do vim.env[k] = v end
  end

  if vimrc and vimrc.statusline then vimrc.statusline.setup() end
end

vimrc.fn.reload()
