local vimrc = _G["vimrc"]
local popup = require('popup')

function vimrc.fn.create_popup(contents, options)
    local opts = {
        title = 'coool',
        line = 1,
        col = 1,
        pos = "botleft",
        time = 4000,
        padding = { 0, 3, 0, 3 },
        -- border = { 1, 1, 1, 1 }
    }

    for k,v in pairs(options) do opts[k] = v end
    popup.create(contents, opts)
end
