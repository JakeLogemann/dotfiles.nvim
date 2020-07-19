" Start the language server
lua require('nvim_lsp').rust_analyzer.setup{on_attach = require('dotfiles').on_attach_lsp}
" lua require('nvim_lsp').rls.setup{on_attach=require('completion').on_attach}
