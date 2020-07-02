" NeoVim Dotfiles
"
" Maintainer:	Jake Logemann <jake.logemann@gmail.com>
" Last Change:	2020 Jun 8
"
function! dotfiles#complete#show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! dotfiles#complete#check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! dotfiles#complete#install_language_servers() abort
  if !executable('yarn') | throw "yarn isn't available!" | endif
  if !executable('bash-language-server') | call system('yarn global add bash-language-server') | endif
  if !executable('vim-language-server')  | call system('yarn global add vim-language-server')  | endif
  if !executable('html-language-server') | call system('yarn global add html-language-server') | endif
endfunction

function! dotfiles#complete#accept() abort
  if pumvisible() 
    return "\<C-y>"
  else
    return "\<CR>"
  endif
endfunction

function! dotfiles#complete#next() abort
  if pumvisible() 
    return "\<C-n>"
  else if dotfiles#complete#check_back_space()
    return "\<C-j>"
  else
    coc#refresh()
  endif
endfunction

function! dotfiles#complete#prev() abort
  if pumvisible() 
    return "\<C-p>"
  else if dotfiles#complete#check_back_space()
    return "\<C-k>"
  else
    coc#refresh()
  endif
endfunction

