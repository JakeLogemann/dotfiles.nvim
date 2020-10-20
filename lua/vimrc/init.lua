vim.env.GIT_ASKPASS = "true"
vim.api.nvim_set_var('libmodalTimeouts', true) -- define modal timeouts; avoid a bug in libmodal!

-- Global Libraries
_G.icons = require'nvim-web-devicons'
_G.libmodal = require'libmodal'
_G.impromptu = require'impromptu'
_G.log = require'vimrc/vendored/log'
_G.lush = require'vimrc/vendored/lush'
_G.pl = require'pl.import_into'()
_G.pl.stringx.import() -- make all strings awesome.
_G.plenary = require'plenary'
_G.pp = require'vimrc/vendored/serpent'
_G.tree = require'tree'
_G.vimrc = (_G.vimrc or {})

-- Global Library Setup Functions
require'terminal'.setup{}
require'surround'.setup{}
require'nvim-web-devicons'.setup{}

-- Dumps debug information about a given variable list of var(s).
-- @param params arbitrary params to output
function _G.dbg(...) 
  print(unpack(vim.tbl_map(pp.dump, {...}))) 
end

-- Require Core Components First
require'vimrc/util' -- keep first
require'vimrc/options'

-- Require Other Internal Components
require'vimrc/mappings'
require'vimrc/packages'
require'vimrc/commands'
require'vimrc/statusline'
require'vimrc/lsp'
require'vimrc/plugins/tree'
require'vimrc/colors'
require'vimrc/diags'
require'vimrc/finders'
require'vimrc/modals'
require'vimrc/tags'
require'vimrc/apis'
require'vimrc/autocommands'
-- require('vimrc.rocks')
require'vimrc/ft/lua'
require'vimrc/plugins/wordy'
require'vimrc/plugins/rust'


return vimrc -- return the module (allows require()s)
