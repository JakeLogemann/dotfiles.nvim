
local language_server_protocol = {}

function language_server_protocol.on_attach()
  require('completion').on_attach()
  require('diagnostic').on_attach()
end

function language_server_protocol.init()
  local nvim_lsp = require'nvim_lsp'

  nvim_lsp.rust_analyzer.setup({
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    on_attach = language_server_protocol.on_attach(),
  })
  -- nvim_lsp.rls.setup({})
  nvim_lsp.bashls.setup({})
  nvim_lsp.vimls.setup({
    cmd = { "vim-language-server" },
    on_attach = language_server_protocol.on_attach(),
  })
  nvim_lsp.rnix.setup({})
  nvim_lsp.html.setup({})
  nvim_lsp.cssls.setup({})
  nvim_lsp.jsonls.setup({})
  nvim_lsp.clangd.setup({})
  nvim_lsp.solargraph.setup({})
  nvim_lsp.sumneko_lua.setup({})
  nvim_lsp.bashls.setup({
    settings = {
      cmd = { "bash-language-server", "start" },
      filetypes = { "sh" },
    }
  })
end

return language_server_protocol
