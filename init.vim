" My NeoVim Configuration
" Maintainer: Jake Logemann <jake.logemann@gmail.com>
"==================================================================================================
let g:dotfiles_vim_config_dir = expand('<sfile>:p:h')
let g:dotfiles_vim_config_file = expand('<sfile>')
"==================================================================================================
let g:dotfiles_vim_config_dir = expand('<sfile>:p:h')
" |startup|    Start Up (Neo)Vim Settings    {{{1
scriptencoding utf-8
set nocompatible
filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

" Builtin Plugins {{{1
"==================================================================================================
let g:loaded_2html_plugin = 1
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logiPat = 1
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_netrw = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_rrhelper = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1

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
" General (Neo)Vim Settings {{{1
"==================================================================================================
set autoread               " Load changes automatically,
set autowrite              " write on lose focus.
set background  =dark
set backspace   =indent,eol,start  " Make backspace work as you would expect.
set backup
set backupext   =-vimbackup
set backupskip  =
set clipboard+=unnamedplus
set complete=.,w,b,k       " C-n completion: Scan buffers, windows and dictionary
set completeopt=menu,menuone,noselect,noinsert
set cursorline             " Find the current line quickly.
set diffopt=vertical,iwhite,hiddenoff,filler
set display     =lastline  " Show as much as possible of the last line.
set fillchars+=vert:\|  " add a bar for vertical splits
set fcs=eob:\              " hide ~ tila
set hidden                 " Switch between buffers without having to save first.
set history     =1000      " change history to 1000
set hlsearch               " Keep matches highlighted.
set incsearch              " Highlight while searching with / or ?.
set infercase              " infer case by first match resutl
set isfname-==             " Remove =, detects filename in var=/foo/bar
set laststatus  =2         " Always show statusline.
set linespace=0            " No extra spaces between rows
set helpheight=12          " Minimum help window height
set noequalalways          " Don't resize windows on split or close
set cmdwinheight=5 cmdheight=2 " Command-line lines
set list                   " Show non-printable characters.
set magic
set mat=5                  " how many tenths of a second to blink
set matchpairs=(:),{:},[:],<:>  " Defines targets of the % motion.
set matchtime=5            " Show matching time
set noerrorbells
set nolazyredraw           " redraw only when necessary.
set noshowmode             " don't show which mode disabled for PowerLine
set previewheight=12       " Completion preview height
set pumheight=20           " Avoid the pop up menu occupying the whole screen
set number norelativenumber
set report=0               " Always report changed lines
set shortmess=filmnrwxsAIqtToOc
set showbreak=…            " show ellipsis at breaking
set showcmd                " Show already typed keys when more are expected.
set showmatch              " show matching braces
set showmode               " Show current mode in command-line.
set smartcase
set scrolloff=2            " keep at least N lines on screen when scrolling up/down.
set nospell spelllang=en spellsuggest=best
set splitbelow splitright  " Open new windows below-right of the current window.
set switchbuf=useopen,vsplit    " Jump to the first open window
set synmaxcol   =2500      " Only highlight columns to N.
set t_ut=                  " http://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging/15095377#15095377
set t_vb        =
set ttyfast                " Faster redrawing.
set undofile
set updatecount =100
set visualbell
set winminheight=1 winminwidth=10 " minimum size for inactive window.
" Text Wrapping {{{2
set whichwrap+=<,>,h,l  " Allow backspace and cursor keys to cross line boundaries
set nowrap              " turn off line wrapping
set linebreak           " set soft wrapping
set wrapmargin=8        " wrap lines when coming within n characters from side
set wrapscan            " Searches wrap around end-of-file.
" }}}

" Always show signs column.
if has('nvim-0.4') | set signcolumn=yes:1 | else | set signcolumn=yes | endif

if executable('rg') "{{{
  set grepformat=%f:%l:%m
  let &grepprg = 'rg --vimgrep' . (&smartcase ? ' --smart-case' : '')
elseif executable('ag')
  set grepformat=%f:%l:%m
  let &grepprg = 'ag --vimgrep' . (&smartcase ? ' --smart-case' : '')
endif "}}}
if has('conceal') && v:version >= 703 "{{{
  set conceallevel=2 concealcursor=niv
endif "}}}
if exists('+inccommand') "{{{
  set inccommand=nosplit
endif "}}}
if has('wildmenu') "{{{
  " Wildmenu
  " --------
  " enhanced command line completion.
  if ! has('nvim')
    " set wildmode=list:longest
    set wildmode=list:longest,full
  endif
  " if has('nvim')
  "   set wildoptions=pum
  " else
  "   set nowildmenu
  "   set wildmode=list:longest,full
  "   set wildoptions=tagfile
  " endif
  set wildignorecase
  set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
  set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
  set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
  set wildignore+=*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip
  set wildignore+=*/tmp/*,*.o,*.obj,*.so     " Unix
  set wildignore+=*\\tmp\\*,*.exe            " Windows
  set wildignore+=application/vendor/**,**/vendor/ckeditor/**,media/vendor/**
  set wildignore+=__pycache__,*.egg-info,.pytest_cache,.mypy_cache/**
  set wildcharm=<C-z>  " substitue for 'wildchar' (<Tab>) in macros
endif  " }}}
if exists('+completepopup') "{{{
  set completeopt+=popup
  set completepopup=height:4,width:60,highlight:InfoPopup
endif "}}}
if exists('+previewpopup') " {{{
  set previewpopup=height:10,width:60
endif " }}}
if exists('+inccommand') " {{{
  " requires nvim 0.4.0+
  set inccommand=split
endif "}}}
if has('patch-8.1.0360') || has('nvim-0.4') "{{{
  set diffopt+=internal,algorithm:patience
  " set diffopt=indent-heuristic,algorithm:patience
endif "}}}
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
if &termguicolors "{{{
endif "}}}
" Window/Terminal Title {{{
"==================================================================================================
set title titlelen=95
let &g:titlestring="
      \ %{expand('%:p:~:.')}%(%m%r%w%)
      \ %<\[%{fnamemodify(getcwd(), ':~')}\] - Neovim"
" }}}

" What to save for views and sessions:
set viewoptions=folds,cursor,curdir,slash,unix
set sessionoptions=curdir,help,tabpages,winsize

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
if has('mouse')  "{{{
  set mouse=nv
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

if exists('&backupskip') "{{{
  " Secure sensitive information, disable backup files in temp directories
  set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*
  set backupskip+=.vault.vim
endif "}}}
" Force write shada on leaving nvim
autocmd VimLeave * if has('nvim') | wshada! | else | wviminfo! | endif
" Check if file changed when its window is focus, more eager than 'autoread'
autocmd FocusGained * checktime
" Automatically set read-only for files being edited elsewhere
autocmd SwapExists * nested let v:swapchoice = 'o'
" Timeouts & Delays {{{1
" --------
set updatetime=5000           " time before "write swap" & CursorHold.
set timeout  timeoutlen=1000  " timeout on mappings
set ttimeout ttimeoutlen=10   " timeout on keycodes
set redrawtime=1500           " Maximum time to allow redraw to run before canceling.

" Tabs & Indent {{{1
" --------
if exists('&breakindent') "{{{
  set breakindentopt=shift:2,min:20
endif "}}}
set shiftwidth  =2         " >> indents by N spaces.
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set shiftround             " Round indent to multiple of 'shiftwidth'
set smarttab               " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set softtabstop =-1        " Tab key indents default to shiftwidth.
set tabstop =2


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
if $TERM == 'xterm-kitty' || $TERM == 'alacritty' "{{{2
  set t_Co=256 termguicolors
  set background=dark
  colorscheme deus
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

" Completion {{{1
" Use LSP omni-completion in Rust files
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
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

call dotfiles#setup()
execute printf("luafile %s", expand('<sfile>:p:h') . "/lua/init.lua")
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

" The following command abbreviation allows typing :tabv myfile.txt to view
" the specified file in a new tab; the buffer is read-only and nomodifiable so
" you cannot accidentally change it.
cabbrev tabv tab sview +setlocal\ nomodifiable

" }}} And a few vim tweaks for easier editing.
" vim: fdm=marker fdo=all fcl=all nu ts=2 sw=2 et
