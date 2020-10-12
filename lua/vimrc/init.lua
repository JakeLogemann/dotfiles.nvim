require('vimrc/globals')

require('vimrc/options')
require('vimrc/mappings')
require('vimrc/commands')
-- require('vimrc.rocks')
require('vimrc/ft/lua')
require('vimrc/plugins/wordy')
require('vimrc/plugins/gutentags')
require('vimrc/plugins/rust')
require('vimrc/plugins/vista')
require('vimrc/lsp').setup_language_servers()

vimp.add_chord_cancellations('n', '<leader>')

