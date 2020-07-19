local dotfiles = {}
local completion = require('dotfiles.completion')
-- local layers = require('spacevim.layer')

function dotfiles.bootstrap()
    completion.init()

    -- options.init()
    -- layers.init()
end

function dotfiles.on_attach_lsp()
  require('completion').on_attach()
  require('diagnostic').on_attach()
end

return dotfiles
