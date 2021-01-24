vimrc.util.win.ephemeral_markdown("Diagnostics", [[
Vimrc Diagnostics
=================
- **USER**: _$(vim.env.USER)_
- **TERM**: _$(vim.env.TERM)_
- **EDITOR**: _$(vim.env.EDITOR)_
- **VISUAL**: _$(vim.env.VISUAL)_

Host Provider Paths
-------------------
- **Node.js**: _$(vim.g.node_host_prog)_
- **Ruby**: _$(vim.g.ruby_host_prog)_
- **Python 3**: _$(vim.g.python3_host_prog)_

Directories
-----------
- **Config Dir**: _$(vim.g.vimrc_config_dir)_
- **Working Dir**: _$(vim.env.PWD)_

Terminal Colors
---------------
0. $(vim.g.terminal_color_0)
1. $(vim.g.terminal_color_1)
2. $(vim.g.terminal_color_2)
3. $(vim.g.terminal_color_3)
4. $(vim.g.terminal_color_4) 
5. $(vim.g.terminal_color_5) 
6. $(vim.g.terminal_color_6) 
7. $(vim.g.terminal_color_7) 
8. $(vim.g.terminal_color_8) 
9. $(vim.g.terminal_color_9) 
10. $(vim.g.terminal_color_10)
11. $(vim.g.terminal_color_11)
12. $(vim.g.terminal_color_12)
13. $(vim.g.terminal_color_13)
14. $(vim.g.terminal_color_14)
15. $(vim.g.terminal_color_15)

vimrc.options
-------------
```lua
$(vim.inspect(vimrc.options))
```

Buffer Info
-----------
```lua
$(vim.inspect(vim.fn.getbufinfo(0)))
```

]])
