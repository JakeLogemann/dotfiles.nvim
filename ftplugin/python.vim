" Start the python language server
lua require('nvim_lsp').pyls.setup{on_attach = require('dotfiles').on_attach_lsp}
