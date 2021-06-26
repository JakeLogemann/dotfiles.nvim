package.loaded['vimrc.options'] = nil -- always reload this file.
vimrc.opts = { env = {}, o = {}, g = {}, bo = {}, w = {}, t = {}, }

local stdpath = vim.fn.stdpath

local function concat_list(tbl) return table.concat(tbl, ",") end

local function concat_map(ls)
  local join_pair = function(k,v) return string.format('%s:%s', k, v) end
  local pairs  = vim.tbl_map(join_pair, ls)
  return table.concat(pairs, ",")
end

vimrc.opts.g['Illuminate_delay']                   = 250 -- milliseconds (default 250)
vimrc.opts.g['Illuminate_ftblacklist']             = concat_list({"dirvish"})
vimrc.opts.g['deus_termcolors']                    = vim.o.t_Co
vimrc.opts.g['echodoc#enable_at_startup']          = 1
vimrc.opts.g['echodoc#type']                       = "floating"
vimrc.opts.g['float_preview#auto_close']           = 1  -- default =  1
vimrc.opts.g['float_preview#docked']               = 1  -- default =  1
vimrc.opts.g['float_preview#max_width']            = 50 -- default = 50
vimrc.opts.g['gutentags_dont_load']                = 0
vimrc.opts.g['gutentags_enabled']                  = 0
vimrc.opts.g['gutentags_generate_on_empty_buffer'] = 0
vimrc.opts.g['gutentags_generate_on_missing']      = 0
vimrc.opts.g['gutentags_generate_on_new']          = 0
vimrc.opts.g['gutentags_generate_on_write']        = 0
vimrc.opts.g['gutentags_generate_on_write']        = 0
vimrc.opts.g['gutentags_generate_on_write']        = 0
vimrc.opts.g['markdown_folding']                   = 1
vimrc.opts.g['mapleader']                          = " "
vimrc.opts.g['maplocalleader']                     = "\\"
vimrc.opts.g['neosnippet#snippets_directory']      = stdpath('config') .. '/local/snips'
vimrc.opts.g['node_host_prog']                     = 'node'
vimrc.opts.g['python3_host_prog']                  = 'python3'
vimrc.opts.g['ruby_host_prog']                     = 'ruby'
vimrc.opts.g['suda_smart_edit']                    = 1
vimrc.opts.g['vim_config_file']                    = stdpath('config') .. '/init.vim'
vimrc.opts.g['vim_json_syntax_conceal']            = 0 -- dont hide quotes, etc in json.
vimrc.opts.g['vimrc_config_dir']                   = stdpath('config')
vimrc.opts.g['vimrc_local_dir']                    = stdpath('data')
vimrc.opts.g['vimrc_lua_dir']                      = stdpath('config') .. "/lua"
vimrc.opts.g['vimrc_pack_dir']                     = stdpath('config') .. "/pack"
vimrc.opts.g['vimrc_plugins_dir']                  = stdpath('data') .. "/plugins"
vimrc.opts.g['vimrc_plugins_repos_dir']            = stdpath('data') .. "/plugins/repos"
vimrc.opts.g['vista_close_on_jump']                = 0
vimrc.opts.g['vista_default_executive']            = 'nvim_lsp'
vimrc.opts.g['vista_sidebar_keepalt']              = 0
vimrc.opts.g['vista_sidebar_position']             = 'vertical botright'
vimrc.opts.g['vista_sidebar_width']                = 35
vimrc.opts.g['vista_stay_on_open']                 = 1

vimrc.opts.o.autoindent     = true    -- Indent according to previous line.
vimrc.opts.o.autoread       = true           -- Load changes automatically,
vimrc.opts.o.autowrite      = true          -- write on lose focus.
vimrc.opts.o.backspace      = 'indent,eol,start'  -- Make backspace work as you would expect.
vimrc.opts.o.backup         = true
vimrc.opts.o.backupdir      = stdpath('cache') .. "/backup/"
vimrc.opts.o.backupext      = '.vim-backup'
vimrc.opts.o.inccommand      = 'nosplit'
vimrc.opts.o.breakindentopt = 'shift:2,min:20'
vimrc.opts.o.shiftwidth     = 2
vimrc.opts.o.clipboard      = 'unnamedplus'
vimrc.opts.o.cmdheight      = 2
vimrc.opts.o.cmdwinheight   = 5
-- vimrc.opts.o.completepopup  = concat_map({ height = "4"; width = 60; highlight = "InfoPopup"; })  -- Completion options (for deoplete)
vimrc.opts.o.completeopt    = concat_list({'menuone', 'noinsert', 'noselect'})  -- Completion options (for deoplete)
vimrc.opts.o.complete       = concat_list({'.', 'w', 'b', 'k'}) -- Include paths,buffers,windows,dictionary in C-n completion.
vimrc.opts.o.concealcursor  = 'niv'
vimrc.opts.o.conceallevel   = 2
vimrc.opts.o.cursorline     = true             -- Find the current line quickly.
vimrc.opts.o.diffopt        = 'vertical,iwhite,hiddenoff,filler,internal,algorithm:patience'
vimrc.opts.o.directory      = stdpath('cache') .. "/swap//"
vimrc.opts.o.display        = 'lastline'  -- Show as much as possible of the last line.
vimrc.opts.o.equalalways    = false         -- Don't resize windows on split or close
vimrc.opts.o.errorbells     = false
vimrc.opts.o.expandtab      = true    -- Use spaces instead of tabs.
vimrc.opts.o.fcs            = 'eob: '         -- hide ~ tila
vimrc.opts.o.fileencoding   = 'utf-8'
vimrc.opts.o.fileencodings  = 'utf-8,ucs-bom,gb18030,gbk,gb2312,cp936'
vimrc.opts.o.fillchars      = 'eob: ,vert:|'     -- add a bar for vertical splits
vimrc.opts.o.foldclose      = 'all'
vimrc.opts.o.foldopen       = 'hor,insert,jump,mark,percent,quickfix,search,tag,undo,block'
vimrc.opts.o.grepformat     = '%f:%l:%m'
vimrc.opts.o.grepprg        = 'rg --vimgrep --smart-case'
vimrc.opts.o.helpheight     = 12          -- Minimum help window height
vimrc.opts.o.hidden         = true         -- Switch between buffers without having to save first.
vimrc.opts.o.history        = 5000
vimrc.opts.o.hlsearch       = true       -- Keep matches highlighted.
vimrc.opts.o.ignorecase     = true
vimrc.opts.o.incsearch      = true      -- Highlight while searching with / or ?.
vimrc.opts.o.infercase      = true      -- infer case by first match resutl
vimrc.opts.o.isfname        = '@,48-57,/,.,-,_,+,,,#,$,%,~'
vimrc.opts.o.laststatus     = 2         -- Always show statusline.
vimrc.opts.o.lazyredraw     = false      -- redraw only when necessary.
vimrc.opts.o.linebreak      = true           -- set soft wrapping
vimrc.opts.o.linespace      = 0            -- No extra spaces between rows
vimrc.opts.o.list           = false           -- Show non-printable characters.
vimrc.opts.o.magic          = true
vimrc.opts.o.mat            = 5                  -- how many tenths of a second to blink
vimrc.opts.o.matchpairs     = '(:),{:},[:],<:>'  -- Defines targets of the % motion.
vimrc.opts.o.matchtime      = 5            -- Show matching time
vimrc.opts.o.mouse          = 'anv'
vimrc.opts.o.number         = true
vimrc.opts.o.previewheight  = 12       -- Completion preview height
vimrc.opts.o.pumheight      = 20           -- Avoid the pop up menu occupying the whole screen
vimrc.opts.o.redrawtime     = 1500  -- Maximum time to allow redraw to run before canceling.
vimrc.opts.o.relativenumber = false
vimrc.opts.o.report         = 2          -- report changed lines?
vimrc.opts.o.scrolloff      = 2          -- keep at least N lines on screen when scrolling up/down.
vimrc.opts.o.sessionoptions = 'curdir,help,tabpages,winsize'
vimrc.opts.o.shada          = "!,%,h,'100,f1,<50,s10240"
vimrc.opts.o.shadafile      = stdpath('cache') .. "/main.shada"
vimrc.opts.o.shiftround     = true    -- Round indent to multiple of 'shiftwidth'
vimrc.opts.o.shiftwidth     = 2 -- >> indents by N spaces.
vimrc.opts.o.shortmess      = 'filmnrwxsAIqtToOc'
vimrc.opts.o.showbreak      = '…'            -- show ellipsis at breaking
vimrc.opts.o.showcmd        = true         -- Show already typed keys when more are expected.
vimrc.opts.o.showmatch      = true       -- show matching braces
vimrc.opts.o.showmode       = true        -- Show current mode in command-line.
vimrc.opts.o.signcolumn     = 'yes:1' -- Always show signs column.
vimrc.opts.o.smartcase      = true
vimrc.opts.o.smarttab       = true    -- tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
vimrc.opts.o.softtabstop    = -1       -- Tab key indents default to shiftwidth.
vimrc.opts.o.spell          = false
vimrc.opts.o.spelllang      = 'en'
vimrc.opts.o.spellsuggest   = 'best'
vimrc.opts.o.splitbelow     = true
vimrc.opts.o.splitright     = true
vimrc.opts.o.swapfile       = true
vimrc.opts.o.switchbuf      = 'useopen,vsplit' -- Jump to the first open window
vimrc.opts.o.synmaxcol      = 2500      -- Only highlight columns to N.
vimrc.opts.o.t_8b           = "\\<Esc>[48;2;%lu;%lu;%lum"
vimrc.opts.o.t_8f           = "\\<Esc>[38;2;%lu;%lu;%lum"
vimrc.opts.o.t_Co           = '256' -- default to 256 Colors.
vimrc.opts.o.t_ut           = ''                 -- http://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging/15095377#15095377
vimrc.opts.o.t_vb           = ''
vimrc.opts.o.tabstop        = vimrc.opts.o.shiftwidth
vimrc.opts.o.termguicolors  = true
vimrc.opts.o.timeout        = true
vimrc.opts.o.timeoutlen     = 750  -- time, in milliseconds, to wait for keymap sequence.
vimrc.opts.o.title          = true
vimrc.opts.o.titlelen       = 95
vimrc.opts.o.titlestring    = "%{expand('%:p:~:.')}%(%m%r%w%)"
vimrc.opts.o.ttimeout       = true
vimrc.opts.o.ttimeoutlen    = 750 -- time, in milliseconds, to wait for key codes ("<Tab>").
vimrc.opts.o.ttyfast        = true -- Faster redrawing.
vimrc.opts.o.undodir        = stdpath('cache') .. "/undo/"
vimrc.opts.o.undofile       = true
vimrc.opts.o.undofile       = true
vimrc.opts.o.updatecount    = 100
vimrc.opts.o.updatetime     = 1000 -- time before "write swap" & CursorHold.
vimrc.opts.o.viewoptions    = 'folds,cursor,curdir,slash,unix'
vimrc.opts.o.visualbell     = true
vimrc.opts.o.whichwrap      = 'b,s,<,>,h,l'  -- Allow backspace and cursor keys to cross line boundaries
vimrc.opts.o.wildignorecase = true
vimrc.opts.o.wildmode       = 'list:longest,full'
vimrc.opts.o.winminheight   = 1
vimrc.opts.o.winminwidth    = 10 -- minimum size for inactive window.
vimrc.opts.o.wrap           = false              -- turn off line wrapping
vimrc.opts.o.wrapmargin     = 8        -- wrap lines when coming within n characters from side
vimrc.opts.o.wrapscan       = true            -- Searches wrap around end-of-file.
vimrc.opts.o.listchars = concat_map({ tab = "→", trail="·", extends="↷", precedes="↶" })
vimrc.opts.o.backupskip = concat_list({ "$TEMP/*", "$TMP/*", "$TMPDIR/*", "*/shm/*", ".vault.vim", "/private/var/*", "/tmp/*", })
vimrc.opts.o.wildignore = concat_list({
    '.git',
    '.hg',
    '.svn',
    '.stversions',
    '*.pyc',
    '*.spl',
    '*/.sass-cache/*',
    '*.o',
    '*.out',
    '%*',
    '*~', '*.DS_Store',
    '*.jpg','*.jpeg', '*.png','*.gif',
    '*.zip',
    '**/tmp/**', '**/node_modules/**','**/bower_modules/**',
    '*swp',
    '*.class',
    '*/tmp/*',
    '*.obj',
    '*.so',     -- Unix
    '*\\tmp\\*',
    '*.exe',            -- Windows
    'application/vendor/**',
    '**/vendor/ckeditor/**',
    'media/vendor/**',
    '__pycache__',
    '*.egg-info',
    '.pytest_cache',
  '.mypy_cache/**' })

vimrc.opts.env["BROWSER"]             = ""
vimrc.opts.env["COLORTERM"]           = "truecolor"
vimrc.opts.env["EDITOR"]              = "nvim"
vimrc.opts.env["FZF_CTRL_T_COMMAND"]  = "rg --files --no-ignore --hidden --follow -g '!{.git,node_modules}/*' 2> /dev/null"
vimrc.opts.env["FZF_DEFAULT_COMMAND"] = "rg --files --no-ignore --hidden --follow -g '!{.git,node_modules}/*' 2> /dev/null"
vimrc.opts.env["FZF_DEFAULT_OPTS"]    = "--layout=reverse -m --min-height=100 --color=16 --ansi --tabstop=2 --cycle"
vimrc.opts.env["GCC_COLORS"]          = "error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"
vimrc.opts.env["GIT_ASKPASS"]         = "true"
vimrc.opts.env["LANG"]                = "en_US.utf8"
vimrc.opts.env["LC_ADDRESS"]          = "en_US.UTF-8"
vimrc.opts.env["LC_IDENTIFICATION"]   = "en_US.UTF-8"
vimrc.opts.env["LC_MEASUREMENT"]      = "en_US.UTF-8"
vimrc.opts.env["LC_MONETARY"]         = "en_US.UTF-8"
vimrc.opts.env["LC_NAME"]             = "en_US.UTF-8"
vimrc.opts.env["LC_NUMERIC"]          = "en_US.UTF-8"
vimrc.opts.env["LC_PAPER"]            = "en_US.UTF-8"
vimrc.opts.env["LC_TELEPHONE"]        = "en_US.UTF-8"
vimrc.opts.env["LC_TIME"]             = "en_US.UTF-8"
vimrc.opts.env["LESS"]                = "-BFfQrms -x2 -~ --quit-on-intr"
vimrc.opts.env["MANPAGER"]            = "nvim -n +Man!"
vimrc.opts.env["MANWIDTH"]            = "999"
vimrc.opts.env["PAGER"]               = "less"
vimrc.opts.env["SCCACHE_CACHE_SIZE"]  = "100G"
vimrc.opts.env["SCCACHE_DIR"]         = "/home/jake/.cache/sccache"
vimrc.opts.env["SHELL"]               = "/usr/bin/zsh"

vim.cmd[[
  if exists('+inccommand')    |  set inccommand=nosplit | endif
  if exists('+completepopup') |  set completeopt+=popup completepopup=height:4,width:60,highlight:InfoPopup | endif
  if exists('+previewpopup')  |  set previewpopup=height:10,width:60 | endif
  if has("termguicolors")     |  set termguicolors | endif
  if exists('&pumblend')      |  set pumblend=5 | endif " Pseudo-transparency for completion menu.
  if exists('&winblend')      |  set winblend=5 | endif " Pseudo-transparency for floating window.

  " Use a modern file/terminal encoding by default.
  set termencoding=utf-8
  set fileencoding=utf-8 fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

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

]]
