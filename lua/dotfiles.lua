local M          = {}
local lsp        = require('nvim_lsp')
local completion = require('completion')
local diagnostic = require('diagnostic')

-- Initialize Language Servers
function M.setup_language_servers()
  lsp.rust_analyzer.setup({})
  -- lsp.rls.setup({})
  lsp.bashls.setup({})
  lsp.vimls.setup({})
  lsp.rnix.setup({})
  lsp.html.setup({})
  lsp.cssls.setup({})
  lsp.jsonls.setup({})
  lsp.clangd.setup({})
  lsp.solargraph.setup({})
  -- lsp.sumneko_lua.setup({})
  lsp.bashls.setup({})
  -- completion.on_attach()
  diagnostic.on_attach()
end

-- Initialize colorized highlighting.
function M.setup_colorizer()
  local colorizer  = require('colorizer')
  colorizer.setup {
    css = { rgb_fn = true; };
    scss = { rgb_fn = true; };
    sass = { rgb_fn = true; };
    stylus = { rgb_fn = true; };
    vim = { names = false; };
    tmux = { names = false; };
    'javascript';
    'javascriptreact';
    'typescript';
    'typescriptreact';
    html = {
      mode = 'foreground';
    }
  }
end


function M.example_mode()
  local modal = require('libmodal')
  local win = vim.api.nvim_open_win(0, false, {
    relative='win',
    width=12,
    height=3,
    bufpos={100,10}
  })

  modal.mode.enter('Dotfiles', {
      ['q'] = 'lua FooMode()'
  })
end

-- Main Setup Function
function M.setup()
end

return M