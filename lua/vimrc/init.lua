require('vimp')

-- Remove all previously added vimpeccable maps
vimp.unmap_all()

require('vimrc.options')
require('vimrc.mappings')
require('vimrc.commands')
require('vimrc.plugins.wordy')
require('vimrc.plugins.gutentags')
require('vimrc.plugins.rust')

vimp.add_chord_cancellations('n', '<leader>')

