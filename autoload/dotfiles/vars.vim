" NeoVim Dotfiles
"
" Maintainer:	Jake Logemann <jake.logemann@gmail.com>
" Last Change:	2020 Jun 8
"
function! dotfiles#vars#init() abort
  let g:dotfiles.dirs        = get(g:dotfiles, 'dirs', {})
  let g:dotfiles.dirs.cache  = get(g:dotfiles.dirs, 'cache',  '~/.cache/nvim')
  let g:dotfiles.dirs.config = get(g:dotfiles.dirs, 'config', '~/.config/nvim')
  let g:dotfiles.dirs.info   = g:dotfiles.dirs.cache  .. '/info'
  let g:dotfiles.dirs.backup = g:dotfiles.dirs.cache  .. '/backup'
  let g:dotfiles.dirs.swap   = g:dotfiles.dirs.cache  .. '/swap'
  let g:dotfiles.dirs.undo   = g:dotfiles.dirs.cache  .. '/undo'
  " let g:dotfiles.dirs.pack   = g:dotfiles.dirs.config .. '/pack'
  " let $CONFIG_DIR            = g:dotfiles.dirs.config
  " let $CACHE_DIR             = g:dotfiles.dirs.cache
  " let $MYVIMRC               = g:dotfiles.dirs.config  .. '/init.vim'
endfunction

function! dotfiles#vars#view() abort
  call dotfiles#json_view(g:, 'dotfiles')
endfunction
