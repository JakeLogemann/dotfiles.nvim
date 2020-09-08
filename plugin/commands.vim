" Custom Command Definitions
command! ReloadBufTabLine   call buftabline#update(0)
command! SudoTee            write !sudo tee % > /dev/null
command! ExecLuaConfig      execute printf("luafile %s", g:dotfiles_vim_config_dir . "/lua/init.lua")

command! -nargs=1 -complete=file DE tabedit <args>
command! -nargs=1 -complete=help Vhelp vertical help <args>
command! -nargs=1 -complete=help Thelp tab help <args>

" :EditConfig   OR   :ViewConfig   {{{
command! EditConfig         call dotfiles#config_edit()
command! BrowseConfigs      call dotfiles#config_browse()
command! ReloadConfig       call dotfiles#config_reload()
command! ViewConfig         call dotfiles#vars#view() " }}}

" :ReloadPlugin   OR   :EditPlugin   {{{
command! -nargs=1 -complete=custom,<SID>ListPlugins ReloadPlugin  execute printf("source %s/plugin/%s.vim", g:dotfiles_vim_config_dir, <q-args>)
command! -nargs=1 -complete=custom,<SID>ListPlugins EditPlugin    execute printf("tabedit %s/plugin/%s.vim", g:dotfiles_vim_config_dir, <q-args>)
function s:ListPlugins(A,L,P)
  return system(printf("ls -1 %s/plugin | sed 's/\.vim//g'", g:dotfiles_vim_config_dir))
endfun " }}}

" :TrimSpaces   OR   :'<,'>TrimSpaces {{{
" nnoremap <S-F12>   m`:TrimSpaces<CR>``
" vnoremap <S-F12>   :TrimSpaces<CR>
function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces() "}}}

" :ShowSpaces [bool] {{{
" nnoremap <F12>     :ShowSpaces 1<CR>
function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction
command -bar -nargs=? ShowSpaces call ShowSpaces(<args>) "}}}

" vim: fdm=marker nu ts=2 sw=2 et
