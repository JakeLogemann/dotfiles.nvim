-- vim: ft=lua
--
if _G["vimrc"] == nil then _G["vimrc"] = { fn = {}; } end

if     vim.fn.has("mac")   == 1 then vimrc.os_family = "macOS"
elseif vim.fn.has("unix")  == 1 then vimrc.os_family = "Linux"
elseif vim.fn.has('win32') == 1 then vimrc.os_family = "Windows"
else vimrc.os_family = "Unsupported" end

function vimrc.load()
  -- load core vimrc functions (keep this section first)
  require('vimrc/fn') -- misc unsorted functions.
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

  -- load vimrc options (keep this section second)
  require('vimrc/options') -- keep second!
  -- load vimrc third-party packages (keep this section third)
  require('vimrc/packages') -- keep third!

  -- load main vimrc configurations.
  require('vimrc/autocommands')
  require('vimrc/colors')
  require('vimrc/commands')
  require('vimrc/completion')
  require('vimrc/find')
  require('vimrc/mappings')
  require('vimrc/plugins/wordy')
  require('vimrc/statusline')
end

function vimrc.reload()
  print("reloading entire vimrc namespace")
  vimrc.fn.unload_lua_namespace("vimrc")
  vimrc.setup()
end

function vimrc.setup()
  vimrc.load()

  -- set opts in neovim (buffer, window, global, terminal, env vars, etc).
  if vimrc and vimrc.opts then
    for k, v in pairs(vimrc.opts.g)   do vim.g[k]   = v end
    for k, v in pairs(vimrc.opts.o)   do vim.o[k]   = v end
    for k, v in pairs(vimrc.opts.t)   do vim.t[k]   = v end
    for k, v in pairs(vimrc.opts.env) do vim.env[k] = v end
  end

  if vimrc and vimrc.fn.init_commands    then vimrc.fn.init_commands() end
  if vimrc and vimrc.fn.setup_completion then vimrc.fn.setup_completion() end
  if vimrc and vimrc.fn.setup_statusline then vimrc.fn.setup_statusline() end
  if vimrc and vimrc.fn.setup_commands   then vimrc.fn.setup_commands() end
end

-- finally, execute the configuration setup.
vimrc.setup()
