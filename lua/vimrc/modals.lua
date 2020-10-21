local libmodal = (libmodal or require('libmodal')) -- exported in init.lua
local M = {} -- define module to be returned.

M.buffer_mode = function()
    libmodal.mode.enter('BUFFER', {
            ['n']    = 'bNext',
            ['f']    = "<cmd>lua vimrc.finders.buffer()<cr>",
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
            ['x']    = 'tabclose',
            ['1']    = 'tabfirst',
            ['0']    = 'tablast',
            ['p']    = 'tabprevious',
            ['c']    = 'tabnew',
            ['exit'] = libmodal.utils.api.mode_exit,
        }) 
end

_G.vimrc.modals = M
return M
