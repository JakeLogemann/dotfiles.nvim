local M = { plugins = {} }
require('vimrc/globals')
require('vimrc/options')
require('vimrc/mappings')
require('vimrc/packages')
require('vimrc/commands')
require('vimrc/statusline')
require('vimrc/lsp')

M.diags = require('vimrc/diags')
M.plugins.telescope = require('vimrc/plugins/telescope')
M.plugins.libmodal = require('vimrc/plugins/libmodal')

-- require('vimrc.rocks')
require('vimrc/ft/lua')
require('vimrc/plugins/wordy')
require('vimrc/plugins/dirvish')
require('vimrc/plugins/gutentags')
require('vimrc/plugins/rust')


_G['vimrc'] = M  -- bind globally as "vimrc".
return M -- return the module (allows require()s)
