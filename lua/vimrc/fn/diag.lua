local vimrc = _G["vimrc"]

-- pretty-print the vimrc options for inspection.
function vimrc.fn.print_options() return print(vim.inspect(vimrc.opts)) end

function vimrc.fn.diagnostics()
  local bufnr = vim.api.nvim_create_buf(false, false)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, vimrc.fn.render_template([[
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

vimrc.opts
-------------
```lua
$(vim.inspect(vimrc.opts))
```

Buffer Info
-----------
```lua
$(vim.inspect(vim.fn.getbufinfo(0)))
```
]]))

  vim.api.nvim_buf_set_option(bufnr, 'filetype', 'markdown')
  vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)
  -- do not list this buffer for selection:
  vim.api.nvim_buf_set_option(bufnr, 'buflisted', false)
  -- do not persist a swapfile for this buffer:
  vim.api.nvim_buf_set_option(bufnr, 'swapfile', false)
  -- remove the buffer when it is hidden:
  vim.api.nvim_buf_set_option(bufnr, 'bufhidden', 'wipe')
  -- buftype=nofile prevents marking buffers as not being backed by a real file, so
  -- theres no need to save.
  vim.api.nvim_buf_set_option(bufnr, 'buftype', 'nofile')


  _G["popup"].create(bufnr, {
      title = 'Diagnostics',
      line = 8,
      col = 55,
      pos = "botleft",
      padding = { 2, 2, 2, 2 },
      minwidth = math.floor((vim.o.columns - 10)*0.66),
      border = { 1, 1, 1, 1 }
    })
  vim.cmd("autocmd WinLeave,BufLeave <buffer> silent! execute 'bwipeout!'")
end
