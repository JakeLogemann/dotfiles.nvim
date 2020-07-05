" NeoVim Dotfiles
"
" Maintainer:	Jake Logemann <jake.logemann@gmail.com>
" Last Change:	2020 Jun 8
"
function! dotfiles#ui#minimal() abort
  setl laststatus=0 noshowmode noruler nocursorline nonu nornu nospell
  autocmd BufLeave,FocusLost <buffer> bdelete
endfunction

function! dotfiles#ui#normal() abort
  setl laststatus=2 showmode ruler cursorline
endfunction

