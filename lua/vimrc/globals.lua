vim.env.GIT_ASKPASS = "true"

vim.api.nvim_set_var('libmodalTimeouts', true) -- enable modal timeouts!

_G['vimp'] = require('vimp')
_G['libmodal'] = require('libmodal')

vim.cmd [[ cabbrev lua Lua ]]

require'nvim-web-devicons'.setup()
require('bufferline').setup()

function _G.dbg(...)
  print(unpack(vim.tbl_map(vim.inspect, {...})))
end

