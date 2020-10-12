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

" Backups, Swapfiles & Undo files {{{
execute "set shadafile=" . expand(g:vim_config_dir) . "/local/main.shada"
execute 'set backup backupdir=' . expand(g:vim_config_dir) . '/local/backup/'
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
execute 'set swapfile directory=' . expand(g:vim_config_dir) . '/local/swap//'
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif
execute 'set undofile undodir=' . expand(g:vim_config_dir) . '/local/undo/'
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif "}}}

" Dotfiles Bootstrapping {{{1
" Ignore system "paths", use only what we provide. {{{
for p in ['~/.local/share/nvim/site','/etc/xdg/nvim','/usr/local/share/nvim/site','/usr/share/nvim/site']
  execute printf("set path-=%s path-=%s/after packpath-=%s rtp-=%s", p, p, p ,p)
endfor
packloadall
" Vendored Plugins Setup {{{1

" include dein in the runtime path.
let g:dein_rtp = g:vim_plugin_repos_dir . '/github.com/Shougo/dein.vim'
execute printf("set rtp+=%s", g:dein_rtp)

if !isdirectory(expand(g:dein_rtp).'/.git')
  " clone dein if it is not a git repo already.
  call mkdir(expand(g:dein_rtp), "p")
  call system(printf("rm -rf %s", g:dein_rtp))
  call system(printf("git clone https://github.com/Shougo/dein.vim %s", g:dein_rtp))
endif

" after loading dein, configure it.
let g:dein#install_progress_type = "tabline"
let g:dein#enable_name_conversion = 1
let g:dein#enable_notification = 1
let g:dein#install_process_timeout = 30
let g:dein#auto_recache = 1
let g:dein#install_log_filename = g:vim_config_dir . '/local/dein.log'
let g:dein#cache_directory = g:vim_plugins_dir
" ensure the cache directory exists.
if !isdirectory(expand(g:dein#cache_directory)) "{{{
  call mkdir(expand(g:dein#cache_directory), "p")
endif "}}}
if dein#load_state(g:vim_plugins_dir) "{{{
  call dein#begin(g:vim_plugins_dir)
  call dein#add(g:dein_rtp)

  " enables neovim support in vim8
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#load_dict(json_decode(readfile(g:vim_config_dir . "/repos.json")))
  call dein#end()
  call dein#save_state()
endif "1}}}
" Command Abbreviations {{{1
cabbrev sord sort

" The following command abbreviation allows typing :tabv myfile.txt to view
" the specified file in a new tab; the buffer is read-only and nomodifiable so
" you cannot accidentally change it.
cabbrev tabv tab sview +setlocal\ nomodifiable
" Auto Commands {{{1
"==================================================================================================
augroup dotfiles_global
  au!
  " http://vim.wikia.com/wiki/Detect_window_creation_with_WinEnter
  au VimEnter * autocmd WinEnter * let w:created=1
  au VimEnter * let w:created=1
  " Disable paste mode on leaving insert mode.
  au InsertLeave * set nopaste
  " automatically clear those fckn search highlights.
  au InsertEnter * noh
  " Force write shada on leaving nvim
  au VimLeave * if has('nvim') | wshada! | else | wviminfo! | endif
  " Check if file changed when its window is focus, more eager than 'autoread'
  au FocusGained * checktime
  " Automatically set read-only for files being edited elsewhere
  au SwapExists * nested let v:swapchoice = 'o'
  au TextYankPost * silent! lua require'vim.highlight'.on_yank()  " requires nvim 0.5.0+
  au BufWritePre *.vim %s/\s\+$//e  " strip trailing spaces in vim files.
  au InsertLeave,VimEnter,WinEnter * setlocal cursorline
  au InsertEnter,WinLeave          * setlocal nocursorline
augroup END

" General (Neo)Vim Settings {{{1
"==================================================================================================

if executable('rg') "{{{
  set grepformat=%f:%l:%m
  let &grepprg = 'rg --vimgrep' . (&smartcase ? ' --smart-case' : '')
elseif executable('ag')
  set grepformat=%f:%l:%m
  let &grepprg = 'ag --vimgrep' . (&smartcase ? ' --smart-case' : '')
endif "}}}

if exists('+inccommand') "{{{
  set inccommand=nosplit
endif "}}}

if exists('+completepopup') "{{{
  set completeopt+=popup
  set completepopup=height:4,width:60,highlight:InfoPopup
endif "}}}

if exists('+previewpopup') " {{{
  set previewpopup=height:10,width:60
endif " }}}

if has("termguicolors") "{{{
  set termguicolors
  if exists('&pumblend') "{{{
    " Pseudo-transparency for completion menu.
    set pumblend=5
  endif "}}}
  if exists('&winblend') "{{{
    " Pseudo-transparency for floating window.
    set winblend=5
  endif "}}}
endif "}}}

" Window/Terminal Title {{{
"==================================================================================================
let &g:titlestring="
      \ %{expand('%:p:~:.')}%(%m%r%w%)
      \ %<\[%{fnamemodify(getcwd(), ':~')}\] - Neovim"
" }}}

" Use a modern file/terminal encoding by default.
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

" Formatting options {{{
set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
set formatoptions-=o         " Disable comment-continuation (normal 'o'/'O')
if has('patch-7.3.541')
  set formatoptions+=j       " Remove comment leader when joining lines
endif "}}}
if &shell =~# 'fish$'  "{{{
  set shell=/bin/bash
endif " }}}
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:→ ,trail:·,extends:↷,precedes:↶'
  " let &listchars = 'tab:→ ,eol:↵,trail:·,extends:↷,precedes:↶'
  " let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" UI/GUI Colorscheme {{{1
"==================================================================================================
if has('gui') && has('gui_running') "{{{
  if exists(':GuiTabline')   | execute GuiTabline 0   | endif
  if exists(':GuiPopupMenu') | execute GuiPopupMenu 0 | endif
  set guifont="Noto Sans Mono Nerd Font":style=Regular:h10
  " set guifont=NotoSansMono:style=Regular:10,NotoSansMono\ Nerd\ Font:style=Regular:10
  " call rpcnotify(1, 'Gui', 'Font', 'Fira Code Nerd Font Complete')
endif "}}}

" Terminal-specific overrides {{{1
if exists('$TMUX') || $TERM == 'xterm-kitty' || $TERM == 'alacritty' "{{{2
  set t_Co=256 termguicolors
  set background=dark
  let g:colors_name = 'deus'
  execute printf("colorscheme %s", g:colors_name)

  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  let g:deus_termcolors=&t_Co
endif "}}}1

" Plugin Configurations {{{1
" =====================

" Plugin: Floating Window {{{2
autocmd User FloatPreviewWinOpen call <SID>DisableExtras()
function! s:DisableExtras()
  call nvim_win_set_option(g:float_preview#win, 'number', v:false)
  call nvim_win_set_option(g:float_preview#win, 'relativenumber', v:false)
  call nvim_win_set_option(g:float_preview#win, 'cursorline', v:false)
endfunction

let g:float_preview#docked     = 1  " default =  1
let g:float_preview#max_width  = 50 " default = 50
let g:float_preview#auto_close = 1  " default =  1

" Plugin: Illuminate {{{2
let g:Illuminate_ftblacklist = ['dirvish']

" Time in milliseconds (default 250)
let g:Illuminate_delay = 250

" Plugin: Completion {{{2
let g:completion_trigger_keyword_length = 3 " default = 1
let g:completion_trigger_on_delete = 1
let g:completion_timer_cycle = 200 "default value is 80

" Plugin: Buffer / Tab Line {{{2
let g:buftabline_show = 1

" Plugin: Lens {{{2
let g:lens#height_resize_max = 49

" Plugin: NeoVide {{{2
let g:neovide_cursor_vfx_mode = "railgun"

" Plugin: Plug {{{2
let g:plug_window = 'tabnew'

" Plugin: EchoDoc {{{2
let g:echodoc#enable_at_startup=0
let g:echodoc#type = 'virtual'
let g:echodoc#type="floating"

let g:vim_json_syntax_conceal = 0

" Plugin: Gutentags {{{2
let g:gutentags_dont_load=0
let g:gutentags_enabled=0
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_generate_on_missing = 0
let g:gutentags_generate_on_new = 0
let g:gutentags_generate_on_write = 0

" Plugin: Rust Configuration {{{2
let g:cargo_makeprg_params = 'build'
let g:cargo_shell_command_runner = '!'  " use exec instead of :terminal (?)
let g:rust_conceal = 1
let g:rust_conceal_mod_path = 0
let g:rust_conceal_pub = 1
let g:rust_fold = 1
let g:rust_recommended_style = 0
let g:rustfmt_autosave = 1
let g:rustfmt_autosave_if_config_present = 1
let g:rustfmt_fail_silently = 1

" Plugin: Iris (Minimal Email Client) {{{2
let g:iris_name  = "Jake Logemann"
let g:iris_mail = "jake.logemann@gmail.com"
let g:iris_imap_host  = "imap.gmail.com"
let g:iris_imap_port  = 993
let g:iris_imap_login = get(g:, 'iris_mail')
let g:iris_idle_enabled = 1
let g:iris_idle_timeout = 15
let g:iris_emails_chunk_size = 50
let g:iris_download_dir = "~/Downloads"

" Plugin: WhichKey {{{2
let g:WhichKeyFormatFunc               = function('which_key#util#format')
let g:which_key_align_by_seperator     = 1
let g:which_key_default_group_name     = '.'
let g:which_key_disable_default_offset = 1
let g:which_key_display_names          = {'<CR>': '↵', '<TAB>': '→'}
let g:which_key_fallback_to_native_key = 1
let g:which_key_flatten                = 1
let g:which_key_floating_relative_win  = 0
let g:which_key_hspace                 = 10
let g:which_key_my_json                = json_decode(readfile(expand(g:vim_config_dir) . "/which_key.json"))
let g:which_key_run_map_on_popup       = 0
let g:which_key_sep                    = '‣'
let g:which_key_sort_horizontal        = 0
let g:which_key_timeout                = 1
let g:which_key_use_floating_win       = 1
let g:which_key_vertical               = 1
"
" Wordy: bad grammar/writer patterns matcher {{{2
let g:wordy#ring = [
  \ 'weak',
  \ ['being', 'passive-voice', ],
  \ 'business-jargon',
  \ 'weasel',
  \ 'puffery',
  \ ['problematic', 'redundant', ],
  \ ['colloquial', 'idiomatic', 'similies', ],
  \ 'art-jargon',
  \ ['contractions', 'opinion', 'vague-time', 'said-synonyms', ],
  \ 'adjectives',
  \ 'adverbs',
  \ ]

" Statusline configuration {{{2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

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
" Install any missing plugins on startup.
if dein#check_install()
  call dein#install()
  call dein#remote_plugins()
  call dein#recache_runtimepath()
endif "}}}
" Custom Command Definitions {{{1
command! ReloadBufTabLine   call buftabline#update(0)
command! SudoTee            write !sudo tee % > /dev/null

command! -nargs=1 -complete=file DE tabedit <args>
command! -nargs=1 -complete=help Vhelp vertical help <args>
command! -nargs=1 -complete=help Thelp tab help <args>

" :EditConfig   OR   :ViewConfig   {{{
command! EditConfig         call dotfiles#config_edit()
command! BrowseConfigs      call dotfiles#config_browse()
command! ReloadConfig       call dotfiles#config_reload()
command! ViewConfig         call dotfiles#vars#view() " }}}

" :EditLua [name]  {{{
command! -nargs=1 -complete=custom,<SID>ListLua EditLua    execute printf("tabedit %s/lua/%s.lua", g:vim_config_dir, <q-args>)
function s:ListLua(A,L,P)
  return system(printf("ls -1 %s/lua | sed 's/\.lua//g'", g:vim_config_dir))
endfun " }}}

" :ReloadPlugin [name]  OR   :EditPlugin [name]  {{{
command! -nargs=1 -complete=custom,<SID>ListPlugins ReloadPlugin  execute printf("source %s/plugin/%s.vim", g:vim_config_dir, <q-args>)
command! -nargs=1 -complete=custom,<SID>ListPlugins EditPlugin    execute printf("tabedit %s/plugin/%s.vim", g:vim_config_dir, <q-args>)
function s:ListPlugins(A,L,P)
  return system(printf("ls -1 %s/plugin | sed 's/\.vim//g'", g:vim_config_dir))
endfun " }}}

" :TrimSpaces   OR   :'<,'>TrimSpaces {{{
" nnoremap <S-F12>   m`:TrimSpaces<CR>``
" vnoremap <S-F12>   :TrimSpaces<CR>
function! TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction
command! -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces() "}}}

" :ShowSpaces [bool] {{{
" nnoremap <F12>     :ShowSpaces 1<CR>
function! ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction
command! -bar -nargs=? ShowSpaces call ShowSpaces(<args>) "}}}

function s:AutoMkdirIfNotExists() "{{{
  let dir = expand('%:p:h')
  if dir =~ '://' | return | endif
  if !isdirectory(dir)
    call mkdir(dir, 'p')
    echo 'Created non-existing directory: '.dir
  endif
endfunction
autocmd BufWritePre * call s:AutoMkdirIfNotExists() "}}}

" Keybinds {{{1
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Release keymappings prefixes, evict entirely for use of plug-ins.
nnoremap <Space>  <Nop>
xnoremap <Space>  <Nop>
nnoremap ,        <Nop>
xnoremap ,        <Nop>
nnoremap \        <Nop>
xnoremap \        <Nop>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <C-Space>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ completion#trigger_completion()

" NeoVim Lua Completion Lib (DISABLED) {{{
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" }}}

nnoremap <silent>       <leader>        :<C-U>WhichKey! g:which_key_my_json.normal<CR>
vnoremap <silent>       <leader>        :<C-U>WhichKeyVisual! g:which_key_my_json.visual<CR>
" nnoremap <silent>       <localleader>   :<C-U>WhichKey! g:which_key_my_json.normal<CR>
" vnoremap <silent>       <localleader>   :<C-U>WhichKeyVisual! g:which_key_my_json.visual<CR>

" Final Setup & Cleanup {{{1
execute printf("luafile %s", g:vim_lua_init)
" call dotfiles#setup()
" ExecLuaConfig
scriptencoding utf-8
set nocompatible
filetype plugin on  " Load filetypes according to standards.
filetype indent on  " Load filetype indent settings according standards.
syntax on           " Enable syntax highlighting.
" vim: fdm=marker nu ts=2 sw=2 et noai fdo=all fcl=all
