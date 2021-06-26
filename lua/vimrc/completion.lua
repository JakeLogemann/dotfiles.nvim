-- completion
paq {'shougo/deoplete-lsp'}
paq {'shougo/deoplete.nvim', run = vim.fn['remote#host#UpdateRemotePlugins']}
paq {'nvim-treesitter/nvim-treesitter'}
paq {'neovim/nvim-lspconfig'}

vim.g["space_before_virtual_text"] = 1
vim.g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup

-- paq {'ojroques/nvim-lspfuzzy'}
-- require('lspfuzzy').setup({})  -- Make the LSP client use FZF instead of the quickfix list
-- bindmap('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
-- bindmap('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
-- bindmap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
-- bindmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- bindmap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
-- bindmap('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
-- bindmap('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
-- bindmap('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
-- bindmap('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

if     vim.fn.has("mac")   == 1 then vim.g["os_family"] = "macOS"
elseif vim.fn.has("unix")  == 1 then vim.g["os_family"] = "Linux"
elseif vim.fn.has('win32') == 1 then vim.g["os_family"] = "Windows"
else                                 vim.g["os_family"] = "Unknown"
end

-- Lua Language Server --
local sumneko = {}
sumneko["root_path"] = vim.env["HOME"]..'/.local/src/github.com/sumneko/lua-language-server'
sumneko["binary"] = sumneko["root_path"].."/bin/".. vim.g["os_family"] .."/lua-language-server"
sumneko["main"] = sumneko["root_path"].."/main.lua"
sumneko["rtp"] = vim.split(package.path, ';')
table.insert(sumneko["rtp"], "lua/?.lua")
table.insert(sumneko["rtp"], "lua/?/init.lua")
if vim.fn.exists(sumneko["main"]) and vim.fn.executable(sumneko["binary"]) then
  lspconfig.sumneko_lua.setup({
    cmd = { sumneko["binary"], "-E", sumneko["main"] };
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = sumneko["rtp"],
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {
            'daedalus',
            'devicons',
            'pac',
            'el',
            'libmodal',
            'vimrc',
            'lspcompletion',
            'lspconfig',
            'pl',
            'pp',
            'surround',
            'telescope',
            'terminal',
            'vim',
            'vlog',
          },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  })
end


lspconfig.rust_analyzer.setup({})
-- lspconfig.rls.setup({})
lspconfig.bashls.setup({})
lspconfig.vimls.setup({})
lspconfig.rnix.setup({})
lspconfig.gopls.setup({})
lspconfig.html.setup({})
lspconfig.cssls.setup({})
lspconfig.jsonls.setup({})
lspconfig.clangd.setup({})
lspconfig.solargraph.setup({})
lspconfig.bashls.setup({})

local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}
