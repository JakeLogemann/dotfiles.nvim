" My NeoVim Configuration
"
" Maintainer:	Jake Logemann <jake.logemann@gmail.com>
"
" (hint: use K to jump to a definition in :help) 
"
" General (Neo)Vim Settings {{{1
scriptencoding utf-8
set nocompatible
filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

" disable a few builtin plugins which i never use
let g:loaded_tutor_mode_plugin = v:true
let g:loaded_2html_plugin = v:true

let mapleader = '\'
let maplocalleader = ' '
set autoindent             " Indent according to previous line.
set autoread               " Load changes automatically,
set autowrite              " write on lose focus.
set background  =dark
set backspace   =indent,eol,start  " Make backspace work as you would expect.
set backup
set backupext   =-vimbackup
set backupskip  =
set clipboard+=unnamedplus
set cmdheight   =1         " command bar height
set completeopt-=preview
set cursorline             " Find the current line quickly.
set diffopt    +=vertical,iwhite,internal,algorithm:patience,hiddenoff
set display     =lastline  " Show as much as possible of the last line.
set expandtab              " Use spaces instead of tabs.
set hidden                 " Switch between buffers without having to save first.
set history     =1000      " change history to 1000
set hlsearch               " Keep matches highlighted.
set incsearch              " Highlight while searching with / or ?.
set laststatus  =2         " Always show statusline.
set linebreak              " set soft wrapping
set matchtime=5            " Show matching time
set report=0               " Always report changed lines
set linespace=0            " No extra spaces between rows
set pumheight=20           " Avoid the pop up menu occupying the whole screen
set list                   " Show non-printable characters.
set magic 
set mat=5                  " how many tenths of a second to blink
set matchpairs=(:),{:},[:],<:>  " Defines targets of the % motion.
set noerrorbells
set nolazyredraw           " Only redraw when necessary.
set noshowmode             " don't show which mode disabled for PowerLine
set nospell 
set nowrap                 " turn off line wrapping
set number                 " show line numbers
set relativenumber
set report      =0         " Always report changed lines.
set shiftround             " >> indents to next multiple of 'shiftwidth'.
set shiftwidth  =2         " >> indents by N spaces.
set shortmess   =filmnrwxsAIqtToOc
set showbreak   =…         " show ellipsis at breaking
set showcmd                " Show already typed keys when more are expected.
set showmatch              " show matching braces
set showmode               " Show current mode in command-line.
set signcolumn  =yes
set smartcase 
set smarttab               " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set so          =7         " set 7 lines to the cursors - when moving vertical
set softtabstop =2         " Tab key indents by N spaces.
set spelllang   =en 
set spellsuggest=best
set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.
set synmaxcol   =200       " Only highlight the first 200 columns.
set t_ut=                  " http://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging/15095377#15095377
set t_vb        =
set tabstop     =2
set timeoutlen=1000 
set title             " set terminal title
set tm          =500
set ttimeoutlen=0
set ttyfast                " Faster redrawing.
set undofile
set updatecount =100
set updatetime  =300
set visualbell
set winminheight=0
set wildmode=list:longest,full
set wildmenu               " enhanced command line completion
set wrapmargin  =8         " wrap lines when coming within n characters from side
set wrapscan               " Searches wrap around end-of-file.
set whichwrap+=<,>,h,l  " Allow backspace and cursor keys to cross line boundaries

" Use a modern file/terminal encoding by default.
set termencoding=utf-8 | set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

" Ignore completing certain file types...
set wildignore+=*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip
set wildignore+=*/tmp/*,*.o,*.obj,*.so     " Unix
set wildignore+=*\\tmp\\*,*.exe            " Windows

if has('mouse') | set mouse=a | endif
if &shell =~# 'fish$' | set shell=/bin/bash | endif
if (has("termguicolors")) | set termguicolors | endif

if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:→ ,trail:·,extends:↷,precedes:↶'
  " let &listchars = 'tab:→ ,eol:↵,trail:·,extends:↷,precedes:↶'
  " let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" requires nvim 0.4.0+
set inccommand=split

augroup LuaHighlight
  " requires nvim 0.5.0+
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" inside tmux, unless its kitty.
if exists('$TMUX') && $TERM != 'xterm-kitty'
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

" Colorscheme & Highlighting {{{1
set background=dark
colorscheme nightfly 

" GUI Configuration {{{1
if has('gui') && has('gui_running')
  if exists(':GuiTabline')   | execute GuiTabline 0   | endif 
  if exists(':GuiPopupMenu') | execute GuiPopupMenu 0 | endif 
  set guifont="Noto Sans Mono Nerd Font":style=Regular:h10
  " set guifont=NotoSansMono:style=Regular:10,NotoSansMono\ Nerd\ Font:style=Regular:10
  " call rpcnotify(1, 'Gui', 'Font', 'Fira Code Nerd Font Complete')
else
  set t_Co=256 termguicolors
endif
" Global Plugin Configuration {{{1
let g:cargo_makeprg_params = 'build'
let g:cargo_shell_command_runner = '!'  " use exec instead of :terminal (?)
let g:echodoc#enable_at_startup=1
let g:echodoc#type="floating"
let g:error_symbol=""
let g:fzf_layout = {'window':{'width':0.9,'height':0.6}}
let g:info_symbol=""
let g:lens#height_resize_max = 49
let g:neovide_cursor_vfx_mode = "railgun"
let g:plug_window = 'tabnew'
let g:ruby_host_prog = '~/.gem/ruby/2.7.0/bin/neovim-ruby-host'
let g:rust_conceal = 1
let g:rust_conceal_mod_path = 0
let g:rust_conceal_pub = 1
let g:rust_fold = 1
let g:rust_recommended_style = 0
let g:rustfmt_autosave = 1
let g:rustfmt_autosave_if_config_present = 1
let g:rustfmt_fail_silently = 1
let g:vim_json_syntax_conceal = 0
let g:warning_symbol=""
let g:gutentags_enabled=0
let g:gutentags_dont_load=0
let g:gutentags_generate_on_missing = 0
let g:gutentags_generate_on_new = 0
let g:gutentags_generate_on_write = 0
let g:gutentags_generate_on_empty_buffer = 0
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'

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
command! EditConfig     call dotfiles#config_edit()
command! ReloadConfig   call dotfiles#config_reload()
command! BrowseConfigs  call dotfiles#config_browse()
command! ViewConfig     call dotfiles#vars#view()
command! EditKeybinds   call dotfiles#keybinds#edit()
command! ReloadKeybinds call dotfiles#keybinds#reload()

" :W saves a file with sudo.
command! W w !sudo tee % > /dev/null

" setup rust_analyzer LSP (IDE features)
lua require'nvim_lsp'.rust_analyzer.setup{}

" Use LSP omni-completion in Rust files
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc

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
" }}}
let g:dotfiles_vim_config_dir = expand('<sfile>:p:h')
let g:dotfiles_vim_config_file = expand('<sfile>')
call dotfiles#setup()
" }}}
" vim: fdm=marker
