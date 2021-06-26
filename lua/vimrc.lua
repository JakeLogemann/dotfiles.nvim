-- vim: ft=lua
if _G["vimrc"] == nil then _G["vimrc"] = {} end

-- load core vimrc components.
require('vimrc/fn')       -- keep first!
require('vimrc/options')  -- keep second!
require('vimrc/packages') -- keep third!

-- load main vimrc configurations.
require('vimrc/autocommands')
require('vimrc/colors')
require('vimrc/commands')
require('vimrc/completion')
require('vimrc/find')
require('vimrc/mappings')
require('vimrc/statusline')

-- additional plugin configurations
-- require('vimrc/plugins/tree')
require('vimrc/plugins/wordy')

vimrc.fn.reload()
