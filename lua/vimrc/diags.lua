local util = require'vimrc.util'

  -- We save handle to window from which we open the navigation
local start_win = vim.api.nvim_get_current_win()
vim.api.nvim_command('botright vnew') -- We open a new vertical window at the far right
local winnr = vim.api.nvim_get_current_win() -- We save our navigation window handle...
local bufnr = vim.api.nvim_get_current_buf() -- ...and it's buffer handle.

local res = pl.stringx.splitlines(pl.template.substitute([[

Vimrc Diagnostics
=================
- **Current User**: `$(vim.env.USER)`

- **Host Provider Paths**:
  - **Node.js**: `$(vim.g.node_host_prog)`
  - **Ruby**: `$(vim.g.ruby_host_prog)`
  - **Python 3**: `$(vim.g.python3_host_prog)`

- **Directories**:
  - **Config Dir**: `$(vim.g.vimrc_config_dir)`
  - **Working Dir**: `$(vim.env.PWD)`

]], {
  vimrc = vimrc,
  vim = vim, 
  pl = pl,
}))

vim.api.nvim_buf_set_name(bufnr, "Diagnostics"..'.'..bufnr)
vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, res)
vim.api.nvim_buf_set_option(bufnr, 'filetype', 'markdown')
vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)
-- Now we set some options for our buffer.
-- nofile prevent mark buffer as modified so we never get warnings about not saved changes.
-- Also some plugins treat nofile buffers different.  For example coc.nvim don't triggers
-- aoutcompletation for these.
vim.api.nvim_buf_set_option(bufnr, 'buftype', 'nofile')
vim.api.nvim_buf_set_option(bufnr, 'buflisted', false)
vim.api.nvim_buf_set_option(bufnr, 'modified', false)
-- We do not need swapfile, backup, etc.
vim.api.nvim_buf_set_option(bufnr, 'swapfile', false)
-- And we would rather prefer that buffer will be destroyed when hide.
vim.api.nvim_buf_set_option(bufnr, 'bufhidden', 'wipe')
-- For better UX we will turn off line wrap and turn on current line highlight.
vim.api.nvim_win_set_option(winnr, 'wrap', false)
vim.api.nvim_win_set_option(winnr, 'cursorline', true)
vim.api.nvim_win_set_option(winnr, 'number', true)
vim.cmd("autocmd WinLeave <buffer> silent! execute 'bdelete! ".. bufnr .."'")
