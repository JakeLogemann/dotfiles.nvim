local lsp        = require('lspconfig')
local default_lsp_settings = {
  on_attach = function(client)
    require('completion').on_attach(client)
  end
}

vim.g.space_before_virtual_text = 1

lsp.rust_analyzer.setup(default_lsp_settings)
-- lsp.rls.setup({})
lsp.bashls.setup(default_lsp_settings)
lsp.vimls.setup(default_lsp_settings)
lsp.rnix.setup(default_lsp_settings)
lsp.gopls.setup(default_lsp_settings)
lsp.html.setup(default_lsp_settings)
lsp.cssls.setup(default_lsp_settings)
lsp.jsonls.setup(default_lsp_settings)
lsp.clangd.setup(default_lsp_settings)
lsp.solargraph.setup(default_lsp_settings)
lsp.bashls.setup(default_lsp_settings)

