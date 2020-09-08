" My NeoVim Configuration
" Maintainer: Jake Logemann <jake.logemann@gmail.com>
"==================================================================================================

" Leader & LocalLeader definition
"================================
if has('vim_starting') "{{{
  let g:dotfiles_vim_config_dir  = expand('<sfile>:p:h')
  let g:dotfiles_vim_config_file = expand('<sfile>')
  let g:dotfiles_vendor_dir = expand('<sfile>:p:h') . '/vendor'
  let g:dotfiles_vendor_repos = g:dotfiles_vendor_dir . '/repos'
  let g:dotfiles_vendor_rtp_lib = g:dotfiles_vendor_repos . '/github.com/Shougo/dein.vim'
  let g:dotfiles_repos = json_decode(readfile(expand('<sfile>:p:h')."/repos.json"))

  " Avoid search where path is known, speeding up start-up.
  let g:python3_host_prog = filereadable('/usr/bin/python3') ? '/usr/bin/python3' : null
  let g:ruby_host_prog = filereadable('/usr/bin/ruby') ? '/usr/bin/ruby' : null
  let g:node_host_prog = filereadable('/usr/bin/node') ? '/usr/bin/node' : null

  " Required before loading plugins, to allow sane keybindings!
  let g:mapleader="\<Space>"
  let g:maplocalleader = '\'
endif "}}}

" Auto Commands {{{1
"==================================================================================================
augroup dotfiles_auto_format
  au!
  au BufWritePre *.vim %s/\s\+$//e
augroup END

" Completion {{{1

augroup CompletionTriggerCharacter
    autocmd!
    autocmd BufEnter * let g:completion_trigger_character = ['.']
    autocmd BufEnter *.rs,*.c,*.cpp let g:completion_trigger_character = ['.', '::']
augroup END

" Post-Bootstrap Tweaks  (Should be absorbed "soon"(tm))  {{{1

"By default, when switching to another buffer, the current buffer is hidden
"and its window is used to display the requested buffer. However, some
"commands can be configured with the 'switchbuf' option to switch to another
"window, possibly in another tab, if the buffer is currently displayed in
"another window. (`:help 'switchbuf'`).
"
"With the following, you can switch to the next buffer by pressing F8, or the
"previous buffer by pressing Shift-F8. If the target buffer is already
"displayed in a window in one of the tabs, that window will be displayed.
"Otherwise, a new tab will be opened, and the target buffer will be
"displayed in the new window.
set switchbuf=usetab,newtab

" }}} And a few vim tweaks for easier editing.
" Dotfiles Bootstrapping {{{1
" Ignore system "paths", use only what we provide. {{{
for p in ['~/.local/share/nvim/site','/etc/xdg/nvim','/usr/local/share/nvim/site','/usr/share/nvim/site']
  execute printf("set path-=%s path-=%s/after packpath-=%s rtp-=%s", p, p, p ,p)
endfor
packloadall

" Vendored Plugins Setup {{{1
let g:dein#install_progress_type = "tabline"
let g:dein#enable_name_conversion = 1
let g:dein#enable_notification = 1
let g:dein#install_process_timeout = 30
let g:dein#auto_recache = 1
let g:dein#cache_directory = g:dotfiles_vendor_dir
let g:dein#install_log_filename = g:dotfiles_vendor_dir . '/install.log'

execute printf("set rtp+=%s", g:dotfiles_vendor_rtp_lib)

if dein#load_state(g:dotfiles_vendor_dir)
  call dein#begin(g:dotfiles_vendor_dir)
  call dein#add(g:dotfiles_vendor_rtp_lib)
  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#load_dict(g:dotfiles_repos)
  call dein#end()
  call dein#save_state()
endif

" Install any missing plugins on startup.
if dein#check_install()
  call dein#install()
  call dein#remote_plugins()
  call dein#recache_runtimepath()
endif "}}}

call dotfiles#setup() | ExecLuaConfig
scriptencoding utf-8
set nocompatible
filetype plugin on  " Load filetypes according to standards.
filetype indent on  " Load filetype indent settings according standards.
syntax on           " Enable syntax highlighting.
" vim: fdm=marker nu ts=2 sw=2 et
