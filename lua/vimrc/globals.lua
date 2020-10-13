_G['vimp'] = require('vimp') -- install vimpeccable globally..

vim.env.GIT_ASKPASS = "true"

require'nvim-web-devicons'.setup()
require('bufferline').setup()

function _G.dbg(...)
  print(unpack(vim.tbl_map(vim.inspect, {...})))
end

