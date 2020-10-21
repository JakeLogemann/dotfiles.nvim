local lsp        = require('nvim_lsp')
local default_lsp_settings = {
  on_attach = function(client)
    require('completion').on_attach(client)
    require('diagnostic').on_attach(client)
  end
}

lsp.rust_analyzer.setup(default_lsp_settings)
-- lsp.rls.setup({})
lsp.bashls.setup(default_lsp_settings)
lsp.vimls.setup(default_lsp_settings)
lsp.rnix.setup(default_lsp_settings)
lsp.html.setup(default_lsp_settings)
lsp.cssls.setup(default_lsp_settings)
lsp.jsonls.setup(default_lsp_settings)
lsp.clangd.setup(default_lsp_settings)
lsp.solargraph.setup(default_lsp_settings)
lsp.sumneko_lua.setup(vim.tbl_extend("error", default_lsp_settings, { 
    cmd = {"/usr/local/src/lua_lsp/bin/Linux/lua-language-server", "-E", "/usr/local/src/lua_lsp/main.lua"}
  }))
lsp.bashls.setup(default_lsp_settings)

