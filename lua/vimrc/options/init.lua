local config_dir = vim.fn.expand(vim.fn.stdpath('config'))
local local_dir = config_dir .. "/local"
local globals_options = require'vimrc.options.globals'
local builtin_options = require'vimrc.options.builtins'
local env_options = require'vimrc.options.env'

-- Long list items:
-----------------------------------------------------------------------------
vim.o.listchars = table.concat(vim.tbl_map((function(k,v) return string.format('%s:%s', k, v) end), {
      tab = "→",
      trail="·",
      extends="↷",
      precedes="↶"
  }), ",")

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


vim.cmd[[
  if exists('+inccommand')    |  set inccommand=nosplit | endif
  if exists('+completepopup') |  set completeopt+=popup completepopup=height:4,width:60,highlight:InfoPopup | endif
  if exists('+previewpopup')  |  set previewpopup=height:10,width:60 | endif
  if has("termguicolors")     |  set termguicolors | endif
  if exists('&pumblend')      |  set pumblend=5 | endif " Pseudo-transparency for completion menu.
  if exists('&winblend')      |  set winblend=5 | endif " Pseudo-transparency for floating window.

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
]]


-- apply ENV options.
for opt, val in pairs(env_options) do
  vim.env[opt] = val
end
-- apply builtin options.
for opt, val in pairs(builtin_options) do
  vim.o[opt] = val
end
-- apply global options.
for opt, val in pairs(globals_options) do
  vim.g[opt] = val
end

_G.vimrc.options = { 
  config_dir = config_dir,
  local_dir = local_dir,
  globals = globals_options,
  builtin = builtin_options,
  env = env_options,
}
