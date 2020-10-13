vim.api.nvim_set_var('libmodalTimeouts', true) -- enable modal timeouts!
_G['libmodal'] = require('libmodal') -- expose libmodal globally.
local M = {} -- define module to be returned.

M.buffer_mode = function()
    libmodal.mode.enter('BUFFER', {
            ['n']    = 'bNext',
            ['f']    = "<cmd>lua require'vimrc/plugins/telescope'.buffers()<cr>",
            ['x']    = 'bclose',
            ['X']    = 'bdelete',
            ['p']    = 'bprevious',
            ['c']    = 'enew',
            ['exit'] = libmodal.utils.api.mode_exit,
        }) 
end

M.tab_mode = function() 
    libmodal.mode.enter('TAB', {
            ['n']    = 'tabNext',
            ['f']    = "<cmd>lua require'vimrc/plugins/telescope'.buffers()<cr>",
            ['x']    = 'tabclose',
            ['X']    = 'bdelete',
            ['p']    = 'bprevious',
            ['c']    = 'enew',
            ['exit'] = libmodal.utils.api.mode_exit,
        }) 
end

return M
