
vim.cmd("augroup LuaVimrc")
vim.cmd("autocmd!") -- clear previous settings

-- https://vim.fandom.com/wiki/Detect_window_creation_with_WinEnter
vim.cmd("autocmd VimEnter * autocmd WinEnter * let w:created=1")

local function define_autocommand(opts)
  local name = opts.name
  local callback = opts.callback
  local events = opts.events or { opts.name, }
  local match = opts.match or { '*', }

  _G.vimrc.autocmd = (_G.vimrc.autocmd or {})
  _G.vimrc.autocmd[name] = callback
  vim.cmd(string.format("autocmd %s %s lua vimrc.autocmd.%s()", 
    table.concat(events,','), 
    table.concat(match, ','), 
    name))
end

define_autocommand({ name = "BufEnter", callback = function() 
  require'completion'.on_attach() 
end })

define_autocommand({ name = "InsertEnter", callback = function() 
  vim.cmd('noh') -- disable highlight
end })

define_autocommand({ name = "InsertLeave", callback = function() 
  vim.o.paste = false 
  vim.cmd('noh') -- disable highlight
end })

define_autocommand({ name = "VimLeave", callback = function() 
      vim.cmd('wshada!') -- ensure ShaDa file is written before exit.
    end })

define_autocommand({
    name = "SwapExists", 
    match = {"* nested"},
    callback = function() 
      vim.v.swapchoice = 'o' -- automatically select readonly when swap exists.
    end,
  })

define_autocommand({ name = "TextYankPost", callback = function() 
  require'vim.highlight'.on_yank()  -- requires nvim 0.5.0+
end })

vim.cmd("augroup END") -- close the autogroup (at end of file).
