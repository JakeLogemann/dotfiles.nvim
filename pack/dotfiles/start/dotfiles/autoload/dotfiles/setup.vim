" NeoVim Dotfiles
"
" Maintainer:	Jake Logemann <jake.logemann@gmail.com>
" Last Change:	2020 Jun 8
"

" Additional "boot" commands, run when editor is first idle.
function! dotfiles#setup#lazy_setup() abort
  let s:idle_booted = 1
endfunction

" Make current window more obvious by turning off/adjusting some features in
" non-current windows.
function! dotfiles#setup#color_row_and_column() abort
  if exists('+colorcolumn')
    highlight ColorColumn ctermbg=0 guibg=#212121
    augroup DotfilesColorRowAndColumn
      autocmd!

      " autocmd BufEnter,FocusGained,VimEnter,WinEnter * 
      "       \ let &l:colorcolumn='+' . join(range(0, 254), ',+')
      " autocmd FocusLost,WinLeave * 
      "       \ let &l:colorcolumn=join(range(1, 255), ',')

      " only show cursorline in the current window
      if exists('+cursorline')
        autocmd InsertLeave,VimEnter,WinEnter * setlocal cursorline
        autocmd InsertEnter,WinLeave          * setlocal nocursorline
      endif

    augroup END
  endif
endfunction

function! dotfiles#setup#augroup() abort
  augroup DotfilesSetup
    autocmd!
    " http://vim.wikia.com/wiki/Detect_window_creation_with_WinEnter
    autocmd VimEnter * autocmd WinEnter * let w:created=1
    autocmd VimEnter * let w:created=1
    " Disable paste mode on leaving insert mode.
    autocmd InsertLeave * set nopaste
    " automatically clear those fckn search highlights.
    autocmd InsertEnter * noh
    if has('vim_starting')
      " Wait until idle to run additional "boot" commands.
      autocmd CursorHold,CursorHoldI * call dotfiles#setup#lazy_setup()
    endif
  augroup END
endfunction

function! dotfiles#setup#dirs() abort
  " Create cache directories automatically before they're needed. {{{
  for d in ['backup', 'dein', 'info', 'swap',  'undo'] 
    let l:path = expand(g:dotfiles.dirs.cache .. '/' .. d)
    if !isdirectory(l:path) 
      call mkdir(l:path, 'p') 
    endif
  endfor "}}}

  " Paths requiring expansion
  execute 'set backupdir=' . expand(g:dotfiles.dirs.backup) . '/'
  execute 'set directory=' . expand(g:dotfiles.dirs.swap) . '//'
  execute 'set undodir=' . expand(g:dotfiles.dirs.undo) . '/'
  " execute "set viminfo=shada='100,n" . expand(g:dotfiles.dirs.info) . "/viminfo"
endfunction

function! dotfiles#setup#dein() abort
  let l:dein_src    = expand(g:dotfiles.dirs.dein .. '/repos/github.com/Shougo/dein.vim')
  let l:dein_url    = 'https://github.com/Shougo/dein.vim'

  " Automatically install dein.vim when necessary.
  if !isdirectory(l:dein_src) 
    call mkdir(expand(g:dotfiles.dirs.dein .. '/repos/github.com/Shougo'), 'p')
    call system('git clone '..l:dein_url..' '..l:dein_src)
  endif

  silent execute printf("set rtp+=%s", l:dein_src)
  let g:dein#auto_recache = 0
  let g:dein#enable_notification = 1
  let g:dein#enable_name_conversion = 1
endfunction
