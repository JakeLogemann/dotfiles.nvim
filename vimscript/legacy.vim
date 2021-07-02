" My NeoVim Configuration
" Maintainer: Jake Logemann <jake.logemann@gmail.com>
"==================================================================================================

" Global Constants  {{{1
"=======================
let g:vim_cache_dir  = expand('$HOME/.cache/nvim')
let g:vim_config_dir  = expand('$HOME/.config/nvim')
let g:vim_local_dir  = expand('$HOME/.local/share/nvim')

"
let g:vim_config_file  = stdpath('config') . '/init.vim'
let g:vim_lua_dir  = stdpath('config') . '/lua'
let g:vim_lua_init = stdpath('config') . '/lua/init.lua'
let g:vim_plugins_dir = stdpath('data') . '/plugins'
let g:vim_plugin_repos_dir = g:vim_plugins_dir . '/repos'

" Autocreate any necessary missing directories {{{2
for p in [stdpath('config'), stdpath('cache'), stdpath('data')]
  if !isdirectory(expand(p)) | call mkdir(expand(p), "p") | endif
endfor

" Ignore system "paths", use only what we provide. {{{2
for p in [ 
      \ '/etc/xdg/nvim', 
      \ '/usr/local/share/nvim/site',
      \ '/usr/share/nvim/site',
      \ ]
  execute printf("set path-=%s path-=%s/before path-=%s/after packpath-=%s rtp-=%s", p, p, p ,p, p)
endfor

" UI/GUI Colorscheme {{{1
"==================================================================================================
if has('gui') && has('gui_running') "{{{ 
  if exists(':GuiTabline')   | execute GuiTabline 0   | endif
  if exists(':GuiPopupMenu') | execute GuiPopupMenu 0 | endif
  set guifont="Noto Sans Mono Nerd Font":style=Regular:h10
  " set guifont=NotoSansMono:style=Regular:10,NotoSansMono\ Nerd\ Font:style=Regular:10
  " call rpcnotify(1, 'Gui', 'Font', 'Fira Code Nerd Font Complete')
endif "}}}

" Plugin: Floating Window {{{2
autocmd User FloatPreviewWinOpen call <SID>DisableExtras()
function! s:DisableExtras()
  call nvim_win_set_option(g:float_preview#win, 'number', v:false)
  call nvim_win_set_option(g:float_preview#win, 'relativenumber', v:false)
  call nvim_win_set_option(g:float_preview#win, 'cursorline', v:false)
endfunction

" Plugin: WhichKey {{{2
" let g:WhichKeyFormatFunc               = function('which_key#util#format')
" let g:which_key_align_by_seperator     = 1
" let g:which_key_default_group_name     = '.'
" let g:which_key_disable_default_offset = 1
" let g:which_key_display_names          = {'<CR>': '↵', '<TAB>': '→'}
" let g:which_key_fallback_to_native_key = 1
" let g:which_key_flatten                = 1
" let g:which_key_floating_relative_win  = 0
" let g:which_key_hspace                 = 10
" let g:which_key_my_json                = json_decode(readfile(expand(g:vim_config_dir) . "/which_key.json"))
" let g:which_key_run_map_on_popup       = 0
" let g:which_key_sep                    = '‣'
" let g:which_key_sort_horizontal        = 0
" let g:which_key_timeout                = 1
" let g:which_key_use_floating_win       = 1
" let g:which_key_vertical               = 1
" nnoremap <silent>       <leader>        :<C-U>WhichKey! g:which_key_my_json.normal<CR>
" vnoremap <silent>       <leader>        :<C-U>WhichKeyVisual! g:which_key_my_json.visual<CR>
" nnoremap <silent>       <localleader>   :<C-U>WhichKey! g:which_key_my_json.normal<CR>
" vnoremap <silent>       <localleader>   :<C-U>WhichKeyVisual! g:which_key_my_json.visual<CR>

function s:AutoMkdirIfNotExists() "{{{
  let dir = expand('%:p:h')
  if dir =~ '://' | return | endif
  if !isdirectory(dir)
    call mkdir(dir, 'p')
    echo 'Created non-existing directory: '.dir
  endif
endfunction
autocmd BufWritePre * call s:AutoMkdirIfNotExists() "}}}

map <F10> :echo "Highlight Groups at Cursor:  " . synIDattr(synID(line("."),col("."),1),"name") . '; '
\ . synIDattr(synID(line("."),col("."),0),"name") . "; "
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . "; "<CR>

lua require 'vimrc'

" Final Setup & Cleanup {{{1
scriptencoding utf-8
set nocompatible
filetype plugin on  " Load filetypes according to standards.
filetype indent on  " Load filetype indent settings according standards.
syntax on           " Enable syntax highlighting.

" Customize Folding Text {{{2
function! MyFoldText()
  let l:expanded_tab = repeat(' ', &tabstop)
  let l:indent = repeat(' ', (&shiftwidth * &foldcolumn))
  let l:lines = (v:foldend - v:foldstart)
  let l:info = '〔' . l:lines . '〕'
  let l:marker = split(&foldmarker, ',')
  let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
  let l:separator = ' … '
  let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
  
  " if there are any "gutter" signs in the margin, add additional padding.
  redir => l:signs | execute 'silent sign place buffer='.bufnr('%') | redir End
  let l:padstart = &foldcolumn + (l:signs =~ 'id=' ? 2 : 0)

  " This block adds extra padding if line numbers enabled.
  if (exists("+relativenumber") && &rnu) 
    let l:padstart += max([&numberwidth, strlen(line('$'))]) + l:infolen
  elseif (exists("+relativenumber") && &relativenumber)
    let l:padstart += max([&numberwidth, strlen(v:foldstart - line('w0')), strlen(line('w$') - v:foldstart), strlen(v:foldstart)]) + l:infolen
  endif

  let l:width = winwidth(0) - (l:padstart + l:infolen)

  " build a 1-line snippet from the last line of the fold. note this is first intentionally.
  let l:lastline = getline(v:foldend)
  let l:lastline = substitute(l:lastline, '\t', l:expanded_tab, 'g')
  let l:lastline = substitute(l:lastline, '^\s*', '', 'g')
  let l:lastline = substitute(l:lastline, '\W*'. l:marker[1] .'.*\W\?', '', '')

  " determine the max length of the first-line based on the last-line.
  let l:lastlinelen = strlen(substitute(l:lastline, '.', 'x', 'g'))
  let l:firstlinelen = l:width - (l:lastlinelen + l:separatorlen)

  " build a 1-line snippet from the first line of the fold. note this is second intentionally.
  let l:firstline = getline(v:foldstart)
  let l:firstline = substitute(l:firstline, '\t', l:expanded_tab, 'g')
  let l:firstline = substitute(l:firstline, '\W*'. l:marker[0] .'.*\W\?', '', '')
  let l:firstline = strpart(l:firstline , 0, l:firstlinelen)

  let l:text = l:firstline . l:separator . l:lastline
  let l:textlen = strlen(substitute(l:text, ".", "x", "g"))
  let l:padding = repeat(' ', l:width - l:textlen)
  return l:text . l:padding . l:info
endfunction

set foldtext=MyFoldText() 

" vim: fdm=marker nu ts=2 sw=2 et noai fdo=all fcl=all
