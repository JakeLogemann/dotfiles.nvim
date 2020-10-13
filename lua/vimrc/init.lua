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

vimp.add_chord_cancellations('n', '<leader>')
_G['vimrc'] = M
return M
