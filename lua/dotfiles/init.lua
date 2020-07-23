
local function lsp_on_attach()
  -- require('completion').on_attach()
  -- require('diagnostic').on_attach()
end

local function lsp_init()
  local nvim_lsp = require'nvim_lsp'

  nvim_lsp.rust_analyzer.setup({
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    on_attach = lsp_on_attach(),
  })
  -- nvim_lsp.rls.setup({})
  nvim_lsp.bashls.setup({})
  nvim_lsp.vimls.setup({
    cmd = { "vim-language-server" },
    on_attach = lsp_on_attach(),
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

local function setup()
    vim.api.nvim_command('echomsg "dotfiles setup initiated..."')
    lsp_init()
end

local function example_mode()
  local win = vim.api.nvim_open_win(0, false, {relative='win', width=12, height=3, bufpos={100,10}})
  require('libmodal').mode.enter('Dotfiles', {
      ['q'] = 'lua FooMode()'
  })
end

return {
  init = setup,
  lsp_init = lsp_init,
  lsp_on_attach = lsp_on_attach,
}
