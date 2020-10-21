" My NeoVim Configuration
" Maintainer: Jake Logemann <jake.logemann@gmail.com>
"==================================================================================================

" Global Constants  {{{1
"=======================
let g:vim_config_dir  = expand('<sfile>:p:h')
let g:vim_config_file  = g:vim_config_dir . '/init.vim'
let g:vim_local_dir  = g:vim_config_dir . '/local'
let g:vim_lua_dir  = g:vim_config_dir . '/lua'
let g:vim_lua_init = g:vim_lua_dir . '/init.lua'

let g:vim_plugins_dir = g:vim_local_dir . '/plugins'
let g:vim_plugin_repos_dir = g:vim_plugins_dir . '/repos'

" Ignore system "paths", use only what we provide. {{{1
for p in ['~/.local/share/nvim/site','/etc/xdg/nvim','/usr/local/share/nvim/site','/usr/share/nvim/site']
  execute printf("set path-=%s path-=%s/after packpath-=%s rtp-=%s", p, p, p ,p)
endfor

" Vim packages ("packpath") configuration {{{1
let g:vimrc_packpath = expand('<sfile>:p:h') . "/pack"
let g:vimrc_default_packpath = expand('<sfile>:p:h') . "/pack/vimrc"

for p in [g:vimrc_packpath, g:vimrc_default_packpath."/opt", g:vimrc_default_packpath."/start"]
  if !isdirectory(expand(p)) | call mkdir(expand(p), "p") | endif
endfor

execute "set packpath+=" . g:vimrc_packpath
packloadall " load all packages, after everything is setup.

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
" vim: fdm=marker nu ts=2 sw=2 et noai fdo=all fcl=all
