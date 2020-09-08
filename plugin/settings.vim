" General (Neo)Vim Settings {{{1
"==================================================================================================
set foldclose=all foldopen=hor,insert,jump,mark,percent,quickfix,search,tag,undo,block
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
set completeopt=menuone,noinsert,noselect " Set completeopt to have a better completion experience
set shortmess+=c                          " Avoid showing message extra message when using completion

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

execute printf("command! -nargs=0 DR%s source %s", expand('<sfile>:t:r'), expand('<sfile>'))
execute printf("command! -nargs=0 DE%s tabedit %s", expand('<sfile>:t:r'), expand('<sfile>'))
