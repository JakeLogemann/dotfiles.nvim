local vimrc = _G["vimrc"]
local popup = require('popup')

local default_opts = {
    title = 'coool',
    line = 1,
    col = 1,
    pos = "botleft",
    time = 4000,
    padding = { 0, 3, 0, 3 },
    -- border = { 1, 1, 1, 1 }
  }

function vimrc.fn.create_popup(contents, opts) popup.create(contents, default_opts) end
