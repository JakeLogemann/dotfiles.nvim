-- My Lua NeoVim Config Scripts
--
-- Maintainer:  Jake Logemann <jake.logemann@gmail.com>
--
require('vimp') -- vimpeccable, not vim.api

vim.o.ignorecase = true
vim.g.mapleader = " "

vimp.mapCommand('SvOpenFileOnGithub', function()
  print("Todo - Open the URL on github for current file on current line")
end)

vimp.mapCommand('SvRename', function(newName)
  print("Todo - rename current file to " .. newName)
end)

