local dotfiles = { completion = {} }
local completion = require('dotfiles.completion')
-- local layers = require('spacevim.layer')

function dotfiles.bootstrap()
    completion.init()

    -- options.init()
    -- layers.init()
end

return dotfiles
