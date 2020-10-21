vim.g.lua_tree_git_hl = 1
vim.g.lua_tree_auto_open = 1
vim.g.lua_tree_auto_close = 1
vim.g.lua_tree_indent_markers = 1
vim.g.lua_tree_tab_open = 1
vim.g.lua_tree_follow = 1
vim.g.lua_tree_width = 35
vim.g.lua_tree_side = "right"
vim.g.lua_tree_ignore = { '.git', 'node_modules' }
vim.g.lua_tree_show_icons = { git=1, folders=1, icons=1 }
vim.g.lua_tree_icons = {
  default= '',
  symlink= '',
  git= {
    unstaged= "✗",
    staged= "✓",
    unmerged= "",
    renamed= "➜",
    untracked= ""
  },
  folder = {
    default= "",
    open= "",
  }
}
vim.g.lua_tree_bindings = {
  edit          = {'<cr>', 'o'}, -- Multiple keys provided via list
  edit_vsplit   = '<c-v>',
  edit_split    = '<c-x>',
  edit_tab      = '<c-t>',
  cd            = '<c-]>',
  preview       = '<Tab>',
  create        = 'a',
  remove        = 'd',
  rename        = 'r',
  cut           = 'x',
  copy          = 'c',
  paste         = 'p',
  prev_git_item = '[c',
  next_git_item = ']c',
}

