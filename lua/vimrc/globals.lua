vim.env.GIT_ASKPASS = "true"

vim.api.nvim_set_var('libmodalTimeouts', true) -- enable modal timeouts!

_G['vimp'] = require('vimp')
_G['libmodal'] = require('libmodal')
_G['plenary'] = require('plenary')
_G['bufferline'] = require('bufferline')
_G['devicons'] = require('nvim-web-devicons')

devicons.setup()

function _G.dbg(...)
  print(unpack(vim.tbl_map(vim.inspect, {...})))
end

