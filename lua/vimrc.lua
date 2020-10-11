require('vimp') -- vimpeccable, not vim.api
require('vimrc.options')
require('vimrc.commands')
require('vimrc.mappings')
vimp.add_chord_cancellations('n', '<leader>')
-- vim: ft=lua
