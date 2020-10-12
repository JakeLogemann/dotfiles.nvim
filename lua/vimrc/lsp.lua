local M          = {}
local lsp        = require('nvim_lsp')
local completion = require('completion')
local libmodal   = require('libmodal')
local diagnostic = require('diagnostic')

-- Initialize Language Servers
function M.setup_language_servers()
  lsp.rust_analyzer.setup({on_attach=require'completion'.on_attach})
  -- lsp.rls.setup({})
  lsp.bashls.setup({on_attach=require'completion'.on_attach})
  lsp.vimls.setup({on_attach=require'completion'.on_attach})
  lsp.rnix.setup({on_attach=require'completion'.on_attach})
  lsp.html.setup({on_attach=require'completion'.on_attach})
  lsp.cssls.setup({on_attach=require'completion'.on_attach})
  lsp.jsonls.setup({on_attach=require'completion'.on_attach})
  lsp.clangd.setup({on_attach=require'completion'.on_attach})
  lsp.solargraph.setup({on_attach=require'completion'.on_attach})
  lsp.sumneko_lua.setup({on_attach=require'completion'.on_attach})
  lsp.bashls.setup({on_attach=require'completion'.on_attach})
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


function M.new_win()
  vim.api.nvim_open_win(0, false, {
    relative='win',
    width=12,
    height=3,
    bufpos={100,10}
  })
end

-- Main Setup Function
function M.setup()
end

return M
