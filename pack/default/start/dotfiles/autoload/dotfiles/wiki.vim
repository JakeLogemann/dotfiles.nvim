" Vimwiki configuration.
function! dotfiles#wiki#init() 
  let g:vimwiki_list = [{
        \ 'path':  '~/wiki/',
        \ 'html_template': '~/wiki/template.html',
        \ 'ext': 'wiki',
        \ 'auto_toc': 1,
        \ 'syntax': 'mediawiki',
        \ 'nested_syntaxes': {'python': 'python', 'c++': 'cpp'}
        \ }]

  let g:vimwiki_map_prefix = '<Leader>W'
endfunction
