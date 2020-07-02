" My NeoVim Configuration
"
" (hint: use K to jump to a definition in :help) 
"
" Maintainer:	Jake Logemann <jake.logemann@gmail.com>
" Last Change:	2020 Jun 8
"
scriptencoding utf-8

" Ignore system "paths", use only what we provide. {{{1
for p in [ 
      \ '~/.local/share/nvim/site', 
      \ '/etc/xdg/nvim',
      \ '/usr/local/share/nvim/site',
      \ '/usr/share/nvim/site']
  execute printf("set path-=%s path-=%s/after packpath-=%s rtp-=%s", p, p, p ,p)
endfor

let g:dotfiles_vim_config_dir = expand('<sfile>:p:h')
let g:dotfiles_vim_config_file = expand('<sfile>')

" General NeoVim Settings {{{1
packloadall
call dotfiles#setup()

set nocompatible
filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

let g:lens#height_resize_max = 49
let g:neovide_cursor_vfx_mode = "railgun"
let g:ruby_host_prog = '~/.gem/ruby/2.7.0/bin/neovim-ruby-host'
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
set list                   " Show non-printable characters.
set magic 
set mat=2                  " how many tenths of a second to blink
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
set wildmenu               " enhanced command line completion
set wrapmargin  =8         " wrap lines when coming within n characters from side
set wrapscan               " Searches wrap around end-of-file.

if has('mouse') | set mouse=a | endif
if &shell =~# 'fish$' | set shell=/bin/bash | endif
if (has("termguicolors")) | set termguicolors | endif

if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" disable a few builtin plugins which i never use
let g:loaded_tutor_mode_plugin = v:true
let g:loaded_2html_plugin = v:true

let g:plug_window = 'tabnew'
let g:fzf_layout = {'window':{'width':0.9,'height':0.6}}
let g:vim_json_syntax_conceal = 0
let g:error_symbol=""
let g:info_symbol=""
let g:warning_symbol=""
let g:echodoc#enable_at_startup=1
let g:echodoc#type="floating"

if has('gui') && has('gui_running') " {{{
  if exists(':GuiTabline')   | execute GuiTabline 0   | endif 
  if exists(':GuiPopupMenu') | execute GuiPopupMenu 0 | endif 
  set guifont="Noto Sans Mono Nerd Font":style=Regular:h10
  " set guifont=NotoSansMono:style=Regular:10,NotoSansMono\ Nerd\ Font:style=Regular:10
  " call rpcnotify(1, 'Gui', 'Font', 'Fira Code Nerd Font Complete')
else
  set t_Co=256 termguicolors
endif " }}}

set background=dark
colorscheme nightfly 

" Startify configuration {{{1
let g:startify_session_persistence = 1
let g:startify_session_dir = printf('%s/sessions', $CACHE_DIR)
let g:startify_files_number = 15
let g:startify_update_oldfiles = 1
let g:startify_enable_special = 0
let g:startify_padding_left = 4
let g:startify_enable_unsafe = 1
let g:startify_change_to_vcs_root = 0
let g:startify_session_delete_buffers = 1
autocmd User Startified setlocal cursorline nonumber norelativenumber nonumber norelativenumber
let g:startify_skiplist = [
        \ 'COMMIT_EDITMSG',
        \ 'bundle/.*/doc',
        \ '^/mnt/',
        \ '^/run/',
        \ '^/tmp/',
        \ ]

let g:startify_bookmarks  = [
            \ {'w': '~/wiki'},
            \ {'c': '~/.config'},
            \ {'s': '~/.ssh/config'},
            \ ]
let g:startify_commands  = [
            \ {'C': ['Search Commands','Commands']},
            \ {'D': ['Edit Config(s)','ConfigEdit']},
            \ {'E': ['Explore working directory','Explore']},
            \ {'F': ['Find File(s)...','Files']},
            \ {'H': ['Search help tags','Helptags']},
            \ {'R': ['Explore runtime directory', printf("Explore %s", expand('<sfile>:p:h'))]},
            \ {'N': ['Add note to personal wiki','VimwikiTabMakeDiaryNote']},
            \ {'W': ['Personal wiki','VimwikiTabIndex']},
            \ ]
let g:startify_lists  = [
            \ {'type': 'sessions', 'header': ['Sessions']},
            \ {'type': 'commands', 'header': ['Commands']},
            \ {'type': 'files',    'header': ['Recent Files']},
            \ ]
let g:startify_custom_header = []

" Statusline configuration {{{1
let g:lightline                              = get(g:, 'lightline', {})
let g:lightline.active                       = get(g:lightline, 'active', {})
let g:lightline.active.left                  = [['mode', 'paste', 'readonly'], ['filename', 'modified']]
let g:lightline.active.right                 = [['lineinfo', 'percent', 'fileformat'], [ 'fileencoding', 'filetype' ], ['cocstatus']]
let g:lightline.component                    = get(g:lightline, 'component', {})
let g:lightline.component.absolutepath       = '%F'
let g:lightline.component.bufnum             = '%n'
let g:lightline.component.charvalue          = '%b'
let g:lightline.component.charvaluehex       = '%B'
let g:lightline.component.close              = ''
let g:lightline.component.column             = '%c'
let g:lightline.component.fileencoding       = '%{&fenc!=#"utf-8"?&fenc:""}'
let g:lightline.component.fileformat         = '%{&ff!=#"unix"?&ff:""}'
let g:lightline.component.filename           = '%t'
let g:lightline.component.filetype           = '%{&ft!=#""?&ft:""}'
let g:lightline.component.line               = '%l'
let g:lightline.component.lineinfo           = '%3l:%-2v'
let g:lightline.component.mode               = '%{lightline#mode()}'
let g:lightline.component.modified           = '%M'
let g:lightline.component.paste              = '%{&paste?"PASTE":""}'
let g:lightline.component.percent            = '%3p%%'
let g:lightline.component.percentwin         = '%P'
let g:lightline.component.readonly           = '%R'
let g:lightline.component.relativepath       = '%f'
let g:lightline.component.spell              = '%{&spell?"SPELL":""}'
let g:lightline.component.winnr              = '%{winnr()}'
let g:lightline.component_function           = get(g:lightline, 'component_function', {})
let g:lightline.component_function.cocstatus = 'coc#status'
let g:lightline.inactive                     = get(g:lightline, 'inactive', {})
let g:lightline.inactive.left                = [['filename','modified']]
let g:lightline.inactive.right               = [['lineinfo'],['percent']]
let g:lightline.mode_map                     = get(g:lightline, 'mode_map', {})
let g:lightline.mode_map.R                   = ' R '
let g:lightline.mode_map.S                   = '-S-'
let g:lightline.mode_map.V                   = '-V-'
let g:lightline.mode_map.c                   = 'CMD'
let g:lightline.mode_map.i                   = ' I '
let g:lightline.mode_map.n                   = ' N '
let g:lightline.mode_map.s                   = ' S '
let g:lightline.mode_map.t                   = ' T '
let g:lightline.mode_map.v                   = ' V '
let g:lightline.mode_map["\<C-s>"]           = '[S]'
let g:lightline.mode_map["\<C-v>"]           = '[V]'
let g:lightline.separator                    = {'left': '', 'right': '' }
let g:lightline.subseparator                 = {'left': '', 'right': '' }
let g:lightline.tab                          = get(g:lightline, 'tab', {})
let g:lightline.tab.active                   = ['tabnum', 'filename', 'modified']
let g:lightline.tab.inactive                 = ['tabnum', 'filename', 'modified']
let g:lightline.tabline                      = get(g:lightline, 'tabline', {})
let g:lightline.tabline.left                 = [['tabs']]
let g:lightline.tabline.right                = [[]]
" Rust configuration {{{1
let g:rust_recommended_style = 0
let g:rust_conceal = 1
let g:rust_conceal_mod_path = 0
let g:rust_conceal_pub = 1
let g:rust_fold = 1
let g:rustfmt_autosave = 1
let g:rustfmt_autosave_if_config_present = 1
let g:rustfmt_fail_silently = 1
let g:cargo_makeprg_params = 'build'
let g:cargo_shell_command_runner = '!'  " use exec instead of :terminal (?)
" General keybinds {{{1

"nnoremap                <c-h>           :SidewaysLeft<cr>
"nnoremap                <c-l>           :SidewaysRight<cr>
tnoremap                <Esc><Esc>      <C-\><C-n>
nnoremap <silent>       <C-s>           :write<cr>

" WhichKey-specific keybinds {{{1
" General configuration for "vim-which-key".
let g:WhichKeyFormatFunc               = function('which_key#util#format')
let g:which_key_align_by_seperator     = 1
let g:which_key_default_group_name     = '.'
let g:which_key_display_names          = {'<CR>': '↵', '<TAB>': '→'}
let g:which_key_fallback_to_native_key = 1
let g:which_key_flatten                = 1
let g:which_key_floating_relative_win  = 0
let g:which_key_hspace                 = 0
let g:which_key_run_map_on_popup       = 0
let g:which_key_sep                    = '‣'
let g:which_key_sort_horizontal        = 0
let g:which_key_timeout                = &timeoutlen
let g:which_key_use_floating_win       = 0
let g:which_key_vertical               = 0
let g:which_key_disable_default_offset = 0

let g:my_which_key_json = json_decode(readfile(expand('<sfile>:p:h') . "/which_key.json"))
nnoremap <silent>       <leader>        :<C-U>WhichKey! g:my_which_key_json.normal<CR>
nnoremap <silent>       <localleader>   :<C-U>WhichKey! g:my_which_key_json.normal<CR>
vnoremap <silent>       <leader>        :<C-U>WhichKeyVisual! g:my_which_key_json.visual<CR>
vnoremap <silent>       <localleader>   :<C-U>WhichKeyVisual! g:my_which_key_json.visual<CR>

" Keybind definitions "vim-which-key".

" VimWiki configuration {{{1
let g:vimwiki_list = [{
      \ 'path':  '~/wiki/',
      \ 'html_template': '~/wiki/template.html',
      \ 'ext': 'wiki',
      \ 'auto_toc': 1,
      \ 'syntax': 'mediawiki',
      \ 'nested_syntaxes': {'python': 'python', 'c++': 'cpp'}
      \ }]

let g:vimwiki_map_prefix = '<Leader>W'


" Completion LSP  {{{1
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" " NVIM LSP Lua Config {{{2
" lua require'nvim_lsp'.rust_analyzer.setup({})
" lua require'nvim_lsp'.vimls.setup({})
" lua require'nvim_lsp'.rnix.setup({})
" lua require'nvim_lsp'.html.setup({})
" lua require'nvim_lsp'.cssls.setup({})
" lua require'nvim_lsp'.jsonls.setup({})
" lua require'nvim_lsp'.clangd.setup({})
" lua require'nvim_lsp'.solargraph.setup({})

" lua << EOF
" local nvim_lsp = require'nvim_lsp'
" nvim_lsp.bashls.setup{
"   settings = {
"     cmd = { 
"       "bash-language-server", 
"       "start" 
"     },
"     filetypes = { 
"       "sh" 
"     } 
"   }
" }
" EOF

" vim: fdm=marker
