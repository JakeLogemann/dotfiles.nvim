" set omnifunc=v:lua.vim.lsp.omnifunc
setlocal foldmethod=syntax
setlocal number
setlocal tabstop=2 expandtab shiftwidth=2

" trim whitespace
autocmd  BufWritePre <buffer> %s/\s\+$//e
