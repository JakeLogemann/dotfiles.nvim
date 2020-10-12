_G['vimp'] = require('vimp') -- install vimpeccable globally..

function _G.dbg(...)
  print(unpack(vim.tbl_map(vim.inspect, {...})))
end

