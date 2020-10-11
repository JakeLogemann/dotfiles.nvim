vim.g.mapleader      = " "
vim.o.ignorecase     = true
vim.o.signcolumn     = 'yes:1' -- Always show signs column.
vim.o.foldclose      = 'all'
vim.o.foldopen       = 'hor,insert,jump,mark,percent,quickfix,search,tag,undo,block'
vim.o.autoread       = true           -- Load changes automatically,
vim.o.autowrite      = true          -- write on lose focus.
vim.o.background     = 'dark'
vim.o.backspace      = 'indent,eol,start'  -- Make backspace work as you would expect.
vim.o.backup         = true
vim.o.backupext      = '.vim-backup'
vim.o.backupskip     = '/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim'
vim.o.clipboard      = 'unnamedplus'
vim.o.complete       = '.,w,b,k'       -- C-n completion: Scan buffers, windows and dictionary
vim.o.completeopt    = 'menu,menuone,noselect,noinsert'
vim.o.cursorline     = true             -- Find the current line quickly.
vim.o.diffopt        = 'vertical,iwhite,hiddenoff,filler'
vim.o.display        = 'lastline'  -- Show as much as possible of the last line.
vim.o.fillchars      = 'eob: ,vert:|'     -- add a bar for vertical splits
vim.o.fcs            = 'eob: '         -- hide ~ tila
vim.o.hidden         = true         -- Switch between buffers without having to save first.
vim.o.history = 5000
vim.o.tabstop = 4
vim.o.shiftwidth = vim.o.tabstop
vim.o.hlsearch       = true       -- Keep matches highlighted.
vim.o.incsearch      = true      -- Highlight while searching with / or ?.
vim.o.infercase      = true      -- infer case by first match resutl
vim.o.isfname        = '@,48-57,/,.,-,_,+,,,#,$,%,~'
vim.o.laststatus     = 2         -- Always show statusline.
vim.o.linespace      = 0            -- No extra spaces between rows
vim.o.helpheight     = 12          -- Minimum help window height
vim.o.equalalways    = false         -- Don't resize windows on split or close
vim.o.cmdwinheight   = 5
vim.o.cmdheight      = 2
vim.o.errorbells     = false
vim.o.lazyredraw     = false      -- redraw only when necessary.
vim.o.linebreak      = true           -- set soft wrapping
vim.o.list           = true             -- Show non-printable characters.
vim.o.magic          = true
vim.o.mat            = 5                  -- how many tenths of a second to blink
vim.o.matchpairs     = '(:),{:},[:],<:>'  -- Defines targets of the % motion.
vim.o.matchtime      = 5            -- Show matching time
vim.o.wrap           = false              -- turn off line wrapping
vim.o.number         = true
vim.o.previewheight  = 12       -- Completion preview height
vim.o.pumheight      = 20           -- Avoid the pop up menu occupying the whole screen
vim.o.relativenumber = false
vim.o.report         = 0               -- Always report changed lines
vim.o.scrolloff      = 2          -- keep at least N lines on screen when scrolling up/down.
vim.o.shortmess      = 'filmnrwxsAIqtToOc'
vim.o.showbreak      = '…'            -- show ellipsis at breaking
vim.o.showcmd        = true         -- Show already typed keys when more are expected.
vim.o.showmatch      = true       -- show matching braces
vim.o.showmode       = true        -- Show current mode in command-line.
vim.o.smartcase      = true
vim.o.spell          = false
vim.o.spelllang      = 'en'
vim.o.spellsuggest   = 'best'
vim.o.splitbelow     = true
vim.o.splitright     = true
vim.o.switchbuf      = 'useopen,vsplit' -- Jump to the first open window
vim.o.synmaxcol      = 2500      -- Only highlight columns to N.
vim.o.t_ut           = ''                 -- http://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging/15095377#15095377
vim.o.t_vb           = ''
vim.o.ttyfast        = true -- Faster redrawing.
vim.o.undofile       = true
vim.o.updatecount    = 100
vim.o.visualbell     = true
vim.o.whichwrap      = 'b,s,<,>,h,l'  -- Allow backspace and cursor keys to cross line boundaries
vim.o.winminheight   = 1
vim.o.winminwidth    = 10 -- minimum size for inactive window.
vim.o.wrapmargin     = 8        -- wrap lines when coming within n characters from side
vim.o.wrapscan       = true            -- Searches wrap around end-of-file.
vim.o.wildmode='list:longest,full'
vim.o.wildignorecase=true
-- vim.o.inccomand='split'
vim.o.diffopt= 'vertical,iwhite,hiddenoff,filler,internal,algorithm:patience'
vim.o.wildignore = table.concat({
    '.git','.hg','.svn','.stversions','*.pyc','*.spl','*.o','*.out','*~','%*',
    '*.jpg','*.jpeg','*.png','*.gif','*.zip','**/tmp/**','*.DS_Store',
    '**/node_modules/**','**/bower_modules/**','*/.sass-cache/*',
    '*swp','*.class','*.pyc','*.png','*.jpg','*.gif','*.zip',
    '*/tmp/*','*.o','*.obj','*.so',     -- Unix
    '*\\tmp\\*','*.exe',            -- Windows
    'application/vendor/**','**/vendor/ckeditor/**','media/vendor/**',
    '__pycache__','*.egg-info','.pytest_cache','.mypy_cache/**' }, ',')

-- Use a modern file/terminal encoding by default.
-- vim.o.termencoding='utf-8'
vim.o.fileencoding='utf-8'
vim.o.fileencodings='utf-8,ucs-bom,gb18030,gbk,gb2312,cp936'

-- What to save for views and sessions:
vim.o.viewoptions='folds,cursor,curdir,slash,unix'
vim.o.sessionoptions='curdir,help,tabpages,winsize'
