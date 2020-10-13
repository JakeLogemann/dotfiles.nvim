_G['vimp'] = require('vimp') -- install vimpeccable globally..

require'nvim-web-devicons'.setup()
require('bufferline').setup()

function _G.dbg(...)
  print(unpack(vim.tbl_map(vim.inspect, {...})))
end

