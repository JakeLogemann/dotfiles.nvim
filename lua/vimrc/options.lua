-- vim.o.inccomand='split'
-- vim.o.termencoding='utf-8'
vim.g.completion_enable_snippet = 'neosnippet'
vim.g.colors_name       = 'deus'
vim.g.deus_termcolors   = vim.o.t_Co
vim.g.mapleader         = " "
vim.g.maplocalleader    = "\\"
vim.g.node_host_prog    = '/usr/bin/node'
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.ruby_host_prog    = '/usr/bin/ruby'
vim.o.autoindent        = true    -- Indent according to previous line.
vim.o.autoread          = true           -- Load changes automatically,
vim.o.autowrite         = true          -- write on lose focus.
vim.o.background        = 'dark'
vim.o.background        = 'dark'
vim.o.backspace         = 'indent,eol,start'  -- Make backspace work as you would expect.
vim.o.backup            = true
vim.o.backupext         = '.vim-backup'
vim.o.breakindentopt    = 'shift:2,min:20'
vim.o.clipboard         = 'unnamedplus'
vim.o.cmdheight         = 2
vim.o.cmdwinheight      = 5
vim.o.complete          = '.,w,b,k'       -- C-n completion: Scan buffers, windows and dictionary
vim.o.completeopt       = 'menu,menuone,noinsert,noselect' -- Set completeopt to have a better completion experience
vim.o.concealcursor     = 'niv'
vim.o.conceallevel      = 2
vim.o.cursorline        = true             -- Find the current line quickly.
vim.o.diffopt           = 'vertical,iwhite,hiddenoff,filler,internal,algorithm:patience'
vim.o.display           = 'lastline'  -- Show as much as possible of the last line.
vim.o.equalalways       = false         -- Don't resize windows on split or close
vim.o.errorbells        = false
vim.o.expandtab         = true    -- Use spaces instead of tabs.
vim.o.fcs               = 'eob: '         -- hide ~ tila
vim.o.fileencoding      = 'utf-8'
vim.o.fileencodings     = 'utf-8,ucs-bom,gb18030,gbk,gb2312,cp936'
vim.o.fillchars         = 'eob: ,vert:|'     -- add a bar for vertical splits
vim.o.foldclose         = 'all'
vim.o.foldopen          = 'hor,insert,jump,mark,percent,quickfix,search,tag,undo,block'
vim.o.helpheight        = 12          -- Minimum help window height
vim.o.hidden            = true         -- Switch between buffers without having to save first.
vim.o.history           = 5000
vim.o.hlsearch          = true       -- Keep matches highlighted.
vim.o.ignorecase        = true
vim.o.incsearch         = true      -- Highlight while searching with / or ?.
vim.o.infercase         = true      -- infer case by first match resutl
vim.o.isfname           = '@,48-57,/,.,-,_,+,,,#,$,%,~'
vim.o.laststatus        = 2         -- Always show statusline.
vim.o.lazyredraw        = false      -- redraw only when necessary.
vim.o.linebreak         = true           -- set soft wrapping
vim.o.linespace         = 0            -- No extra spaces between rows
vim.o.list              = true             -- Show non-printable characters.
vim.o.magic             = true
vim.o.mat               = 5                  -- how many tenths of a second to blink
vim.o.matchpairs        = '(:),{:},[:],<:>'  -- Defines targets of the % motion.
vim.o.matchtime         = 5            -- Show matching time
vim.o.mouse             = 'anv'
vim.o.number            = true
vim.o.previewheight     = 12       -- Completion preview height
vim.o.pumheight         = 20           -- Avoid the pop up menu occupying the whole screen
vim.o.redrawtime        = 1500  -- Maximum time to allow redraw to run before canceling.
vim.o.relativenumber    = false
vim.o.report            = 2          -- report changed lines?
vim.o.scrolloff         = 2          -- keep at least N lines on screen when scrolling up/down.
vim.o.sessionoptions    = 'curdir,help,tabpages,winsize'
vim.o.shiftround        = true    -- Round indent to multiple of 'shiftwidth'
vim.o.shiftwidth        = 2 -- >> indents by N spaces.
vim.o.shortmess         = 'filmnrwxsAIqtToOc'
vim.o.showbreak         = '…'            -- show ellipsis at breaking
vim.o.showcmd           = true         -- Show already typed keys when more are expected.
vim.o.showmatch         = true       -- show matching braces
vim.o.showmode          = true        -- Show current mode in command-line.
vim.o.signcolumn        = 'yes:1' -- Always show signs column.
vim.o.smartcase         = true
vim.o.smarttab          = true    -- tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
vim.o.softtabstop       = -1       -- Tab key indents default to shiftwidth.
vim.o.spell             = false
vim.o.spelllang         = 'en'
vim.o.spellsuggest      = 'best'
vim.o.splitbelow        = true
vim.o.splitright        = true
vim.o.switchbuf         = 'useopen,vsplit' -- Jump to the first open window
vim.o.synmaxcol         = 2500      -- Only highlight columns to N.
vim.o.t_8b              = "\\<Esc>[48;2;%lu;%lu;%lum"
vim.o.t_8f              = "\\<Esc>[38;2;%lu;%lu;%lum"
vim.o.t_Co              = '256' -- default to 256 Colors.
vim.o.t_ut              = ''                 -- http://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging/15095377#15095377
vim.o.t_vb              = ''
vim.o.tabstop           = vim.o.shiftwidth
vim.o.termguicolors     = true
vim.o.timeout           = true
vim.o.timeoutlen        = 1000
vim.o.title             = true
vim.o.title             = true
vim.o.titlelen          = 95
vim.o.titlelen          = 95
vim.o.ttimeout          = true
vim.o.ttimeoutlen       = 10   -- timeout on keycodes
vim.o.ttyfast           = true -- Faster redrawing.
vim.o.undofile          = true
vim.o.updatecount       = 100
vim.o.updatetime        = 5000 -- time before "write swap" & CursorHold.
vim.o.viewoptions       = 'folds,cursor,curdir,slash,unix'
vim.o.visualbell        = true
vim.o.whichwrap         = 'b,s,<,>,h,l'  -- Allow backspace and cursor keys to cross line boundaries
vim.o.wildignorecase    = true
vim.o.wildmode          = 'list:longest,full'
vim.o.winminheight      = 1
vim.o.winminwidth       = 10 -- minimum size for inactive window.
vim.o.wrap              = false              -- turn off line wrapping
vim.o.wrapmargin        = 8        -- wrap lines when coming within n characters from side
vim.o.wrapscan          = true            -- Searches wrap around end-of-file.


-- Long list items:
-----------------------------------------------------------------------------
vim.cmd('colorscheme '.. vim.g.colors_name)
vim.o.backupskip = table.concat({
    "$TEMP/*",
    "$TMP/*",
    "$TMPDIR/*",
    "*/shm/*",
    ".vault.vim",
    "/private/var/*",
    "/tmp/*",
  }, ',')
vim.o.wildignore = table.concat({
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
  '.mypy_cache/**' }, ',')
