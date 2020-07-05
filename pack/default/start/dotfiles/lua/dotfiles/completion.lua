local completion = {}

function completion.init ()
  local nvim_lsp = require'nvim_lsp'
  nvim_lsp.rls.setup({})
  nvim_lsp.bashls.setup({})
  nvim_lsp.vimls.setup({})
  nvim_lsp.rnix.setup({})
  nvim_lsp.html.setup({})
  nvim_lsp.cssls.setup({})
  nvim_lsp.jsonls.setup({})
  nvim_lsp.clangd.setup({})
  nvim_lsp.solargraph.setup({})
  nvim_lsp.sumneko_lua.setup({})
  nvim_lsp.bashls.setup{
    settings = {
      cmd = { "bash-language-server", "start" },
      filetypes = { 
        "sh" 
      } 
    }
  }
end

return completion
