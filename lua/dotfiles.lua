local M          = {}
local lsp        = require('nvim_lsp')
local completion = require('completion')
local libmodal   = require('libmodal')
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


function M.new_win()
  vim.api.nvim_open_win(0, false, {
    relative='win',
    width=12,
    height=3,
    bufpos={100,10}
  })
end

M["commands"] = {}
M["mappings"] = {}

M["mappings"]['q'] = 'lua FooMode()'
M["mappings"]['?'] = 'lua require("dotfiles")["mappings_help"]:show()'
M["commands"]['close'] = 'tabclose'
M["mappings_help"] = libmodal.utils.Help.new(M.mappings, 'MAPS')
M["commands_help"] = libmodal.utils.Help.new(M.commands, 'COMMANDS')

function M.dotfiles_mode()
  libmodal.mode.enter('Dotfiles', M.mappings_table)
end

-- Main Setup Function
function M.setup()
end

return M
