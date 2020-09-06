" My NeoVim Configuration
" Maintainer: Jake Logemann <jake.logemann@gmail.com>
"==================================================================================================
let g:dotfiles_vim_config_dir = expand('<sfile>:p:h')
let g:dotfiles_vim_config_file = expand('<sfile>')
"==================================================================================================
let g:dotfiles_vim_config_dir = expand('<sfile>:p:h')
" |startup|    Start Up (Neo)Vim Settings    {{{1

" Avoid search where path is known, speeding up start-up.
let g:python3_host_prog=filereadable('/usr/bin/python3') ? '/usr/bin/python3' : null
let g:ruby_host_prog=filereadable('/usr/bin/ruby') ? '/usr/bin/ruby' : null
let g:node_host_prog=filereadable('/usr/bin/node') ? '/usr/bin/node' : null

" Builtin Plugins {{{1
"==================================================================================================
let g:loaded_2html_plugin = 1
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 0
let g:loaded_logiPat = 1
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_netrw = 0
let g:loaded_netrwFileHandlers = 0
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 0
let g:loaded_rrhelper = 1
let g:loaded_tar = 0
let g:loaded_tarPlugin = 0
let g:loaded_tutor_mode_plugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zip = 0
let g:loaded_zipPlugin = 0

" Leader & LocalLeader definition {{{1
"==================================================================================================
if has('vim_starting')
  " Required before loading plugins!
  let g:mapleader="\<Space>"
  let g:maplocalleader = '\'
  " Release keymappings prefixes, evict entirely for use of plug-ins.
  nnoremap <Space>  <Nop>
  xnoremap <Space>  <Nop>
  nnoremap ,        <Nop>
  xnoremap ,        <Nop>
  nnoremap \        <Nop>
  xnoremap \        <Nop>
endif "}}}

" UI/GUI Colorscheme {{{1
"==================================================================================================
augroup LuaHighlight "{{{
  autocmd!
  if has('nvim') " requires nvim 0.5.0+
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
  endif
augroup END "}}}

if exists('+colorcolumn') "{{{
  " Make current window more obvious by turning off/adjusting some features
  " in non-current windows.
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
endif "}}}

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
" Auto Commands {{{1
"==================================================================================================
augroup dotfiles_auto_format
  au!
  au BufWritePre *.vim %s/\s\+$//e

augroup END

" Plugin Configurations {{{1
" =================================================================================================

" Plugin: Dashboard {{{2
let g:dashboard_custom_shortcut=get(g:, 'dashboard_custom_shortcut', {})
let g:dashboard_custom_shortcut={}
let g:dashboard_custom_header = [
      \ '',
      \ '   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠞⠉⢉⣭⣿⣿⠿⣳⣤⠴⠖⠛⣛⣿⣿⡷⠖⣶⣤⡀⠀⠀⠀   ',
      \ '    ⠀⠀⠀⠀⠀⠀⠀⣼⠁⢀⣶⢻⡟⠿⠋⣴⠿⢻⣧⡴⠟⠋⠿⠛⠠⠾⢛⣵⣿⠀⠀⠀⠀  ',
      \ '    ⣼⣿⡿⢶⣄⠀⢀⡇⢀⡿⠁⠈⠀⠀⣀⣉⣀⠘⣿⠀⠀⣀⣀⠀⠀⠀⠛⡹⠋⠀⠀⠀⠀  ',
      \ '    ⣭⣤⡈⢑⣼⣻⣿⣧⡌⠁⠀⢀⣴⠟⠋⠉⠉⠛⣿⣴⠟⠋⠙⠻⣦⡰⣞⠁⢀⣤⣦⣤⠀  ',
      \ '    ⠀⠀⣰⢫⣾⠋⣽⠟⠑⠛⢠⡟⠁⠀⠀⠀⠀⠀⠈⢻⡄⠀⠀⠀⠘⣷⡈⠻⣍⠤⢤⣌⣀  ',
      \ '    ⢀⡞⣡⡌⠁⠀⠀⠀⠀⢀⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⠀⠸⣇⠀⢾⣷⢤⣬⣉  ',
      \ '    ⡞⣼⣿⣤⣄⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠸⣿⣇⠈⠻  ',
      \ '    ⢰⣿⡿⢹⠃⠀⣠⠤⠶⣼⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠀⣿⠛⡄⠀  ',
      \ '    ⠈⠉⠁⠀⠀⠀⡟⡀⠀⠈⡗⠲⠶⠦⢤⣤⣤⣄⣀⣀⣸⣧⣤⣤⠤⠤⣿⣀⡀⠉⣼⡇⠀  ',
      \ '    ⣿⣴⣴⡆⠀⠀⠻⣄⠀⠀⠡⠀⠀⠀⠈⠛⠋⠀⠀⠀⡈⠀⠻⠟⠀⢀⠋⠉⠙⢷⡿⡇⠀  ',
      \ '    ⣻⡿⠏⠁⠀⠀⢠⡟⠀⠀⠀⠣⡀⠀⠀⠀⠀⠀⢀⣄⠀⠀⠀⠀⢀⠈⠀⢀⣀⡾⣴⠃⠀  ',
      \ '    ⢿⠛⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠈⠢⠄⣀⠠⠼⣁⠀⡱⠤⠤⠐⠁⠀⠀⣸⠋⢻⡟⠀⠀  ',
      \ '    ⠈⢧⣀⣤⣶⡄⠘⣆⠀⠀⠀⠀⠀⠀⠀⢀⣤⠖⠛⠻⣄⠀⠀⠀⢀⣠⡾⠋⢀⡞⠀⠀⠀  ',
      \ '    ⠀⠀⠻⣿⣿⡇⠀⠈⠓⢦⣤⣤⣤⡤⠞⠉⠀⠀⠀⠀⠈⠛⠒⠚⢩⡅⣠⡴⠋⠀⠀⠀⠀  ',
      \ '    ⠀⠀⠀⠈⠻⢧⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣻⠿⠋⠀⠀⠀⠀⠀⠀  ',
      \ '    ⠀⠀⠀⠀⠀⠀⠉⠓⠶⣤⣄⣀⡀⠀⠀⠀⠀⠀⢀⣀⣠⡴⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀  ',
      \ '                                       ',
      \ '',
      \ ]
" let g:dashboard_custom_shortcut['pleader']='SPC'
" let g:dashboard_custom_shortcut['localleader']='SPC f h'
" let g:dashboard_custom_shortcut['find_file']='SPC f f'
" let g:dashboard_custom_shortcut['change_colorscheme']='SPC t c'
" let g:dashboard_custom_shortcut['find_word']='SPC f a'
" let g:dashboard_custom_shortcut['book_marks']='SPC f b'
" Plugin: Buffer / Tab Line {{{2
let g:buftabline_show = 1
command! ReloadBufTabLine call buftabline#update(0)

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
" Plugin: Ruby Configuration {{{2
let g:ruby_host_prog = expand('$HOME/.rbenv/shims/neovim-ruby-host')
let g:node_host_prog = expand('$HOME/.yarn/bin/neovim-node-host')
" let g:python_host_prog  = ''
" let g:python3_host_prog  = ''
" Plugin: JSON Configuration {{{2
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
let g:which_key_my_json                = json_decode(readfile(expand(g:dotfiles_vim_config_dir) . "/which_key.json"))
let g:which_key_run_map_on_popup       = 0
let g:which_key_sep                    = '‣'
let g:which_key_sort_horizontal        = 0
let g:which_key_timeout                = 1
let g:which_key_use_floating_win       = 1
let g:which_key_vertical               = 1
nnoremap <silent>       <leader>        :<C-U>WhichKey! g:which_key_my_json.normal<CR>
vnoremap <silent>       <leader>        :<C-U>WhichKeyVisual! g:which_key_my_json.visual<CR>
" nnoremap <silent>       <localleader>   :<C-U>WhichKey! g:which_key_my_json.normal<CR>
" vnoremap <silent>       <localleader>   :<C-U>WhichKeyVisual! g:which_key_my_json.visual<CR>
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

" Custom Command Definitions {{{1

command! EditConfig         call dotfiles#config_edit()
command! ReloadConfig       call dotfiles#config_reload()
command! BrowseConfigs      call dotfiles#config_browse()
command! ViewConfig         call dotfiles#vars#view()
command! EditKeybinds       call dotfiles#keybinds#edit()
command! ReloadKeybinds     call dotfiles#keybinds#reload()
command! SudoTee            write !sudo tee % > /dev/null
command! ExecLuaConfig      execute printf("luafile %s", g:dotfiles_vim_config_dir . "/lua/init.lua")

" Completion {{{1

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_trigger_keyword_length = 3 " default = 1
let g:completion_trigger_on_delete = 1
let g:completion_timer_cycle = 200 "default value is 80

augroup CompletionTriggerCharacter
    autocmd!
    autocmd BufEnter * let g:completion_trigger_character = ['.']
    autocmd BufEnter *.rs,*.c,*.cpp let g:completion_trigger_character = ['.', '::']
augroup end

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <C-Space>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

" Statusline configuration {{{1
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
nnoremap <F8> :sbnext<CR>
nnoremap <S-F8> :sbprevious<CR>

" }}} And a few vim tweaks for easier editing.
" Dotfiles Bootstrapping {{{1
" Ignore system "paths", use only what we provide. {{{
for p in [
      \ '~/.local/share/nvim/site',
      \ '/etc/xdg/nvim',
      \ '/usr/local/share/nvim/site',
      \ '/usr/share/nvim/site']
  execute printf("set path-=%s path-=%s/after packpath-=%s rtp-=%s", p, p, p ,p)
endfor
packloadall


" Vendored Plugins Setup {{{1
let g:dotfiles_vendor_dir = expand('<sfile>:p:h') . '/vendor'
let g:dotfiles_vendor_repos = g:dotfiles_vendor_dir . '/repos'
let g:dotfiles_vendor_rtp_lib = g:dotfiles_vendor_repos . '/github.com/Shougo/dein.vim'
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
  call dein#load_dict(json_decode(readfile(expand('<sfile>:p:h')."/repos.json")))
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
