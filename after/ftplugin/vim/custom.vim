setlocal foldmethod=marker
setlocal number
setlocal tabstop=2 expandtab shiftwidth=2
autocmd  BufWritePre <buffer> %s/\s\+$//e

