local neorocks = require("plenary.neorocks")

-- Installs neorocks if necessary and then installs the package you need.
--  Is not synchronous, so should be called from Neovim's command line most likely.
-- neorocks.install('penlight', 'pl')

-- ensure_installed(package_name, lua_name, headless)
-- Only installs if currently not installed.
--
--   package_name : str             - Name of the package for luarocks
--   lua_name     : (optional) str  - Name of the package that you can require. Used to determine if we have it installed already (not from luarocks)
-- neorocks.ensure_installed('penlight', 'pl')
neorocks.ensure_installed('lua-cjson', 'cjson')
