" NeoVim Dotfiles
"
" Maintainer:	Jake Logemann <jake.logemann@gmail.com>
" Last Change:	2020 Jun 8
"
let s:idle_booted = 0

function! dotfiles#setup() abort
  let g:dotfiles = get(g:, 'dotfiles', {})

  call dotfiles#vars#init()
  call dotfiles#setup#dirs()

  call dotfiles#setup#color_row_and_column()
  call dotfiles#setup#augroup()
  call dotfiles#statusline#init()
  call dotfiles#startpage#init()
  call dotfiles#keybinds#init()
  call dotfiles#completion#init()
  call dotfiles#wiki#init()
  call dotfiles#setup#lazy_setup()

endfunction

function! dotfiles#json_view(prefix, keyname) abort
  let json_data = json_encode(get(a:prefix, a:keyname, {}))
  let message = system('jq -Ser "."', json_data)
  if !empty(message)
    tabnew
    setlocal ft=json5 buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    setlocal nonumber norelativenumber nocursorline nolist
    " silent put='// Vim variables '. a:prefix . a:keyname
    silent put=message
    normal ggdd
    setlocal nomodifiable readonly
    autocmd BufLeave <buffer> bdelete
  else
    echoerr "no output"
  endif
endfunction

function! dotfiles#config_view() abort
  call dotfiles#json_view(g:, 'dotfiles')
endfunction

function! dotfiles#config_reload() abort
  execute printf(":source %s", expand(g:dotfiles_vim_config_file))
  echomsg "Reloaded configuration."
endfunction

function! dotfiles#config_edit() abort
  execute printf(":tabedit %s", expand(g:dotfiles_vim_config_file))
  autocmd BufWrite <buffer> call dotfiles#reload()
endfunction

function! dotfiles#config_browse() abort
  execute printf(":Dirvish %s", expand(g:dotfiles_vim_config_dir))
endfunction

