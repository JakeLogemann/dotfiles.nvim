_G.vimrc.autocmd = (_G.vimrc.autocmd or {})

vim.cmd("augroup LuaVimrc")
vim.cmd("autocmd!") -- clear previous settings

-- https://vim.fandom.com/wiki/Detect_window_creation_with_WinEnter
vim.cmd("autocmd VimEnter * autocmd WinEnter * let w:created=1")

local function define_autocommand(name, opts)
  local callback = opts.callback
  local match = opts.match or {'*'}

  _G.vimrc.autocmd[name] = callback
  vim.cmd(string.format("autocmd %s %s lua require'vimrc'.autocmd['%s']()",
    table.concat((opts.events or { name }),','),
    table.concat(match, ','),
    name))
end

define_autocommand("BufEnter", { callback = function()
  require'completion'.on_attach()
  require'diagnostic'.on_attach()
end })

define_autocommand("BufWritePre", {
  callback = function()
  end,
})

define_autocommand("InsertEnter", { callback = function()
  vim.cmd('noh') -- disable highlight
end })

define_autocommand("InsertLeave", { callback = function()
  vim.o.paste = false
  vim.cmd('noh') -- disable highlight
end })

define_autocommand("VimLeave", { callback = function()
      vim.cmd('wshada!') -- ensure ShaDa file is written before exit.
    end })


define_autocommand("RefFileTypes", {
    events = {"FileType"},
    match = {"help"},
    callback = function()
      vimrc.util.buf.disable_extras(0,0)
    end,
  })

define_autocommand("EphemeralFileTypes", {
    events = {"FileType"},
    match = {
      "LuaTree",
      "gina-*",
      "git", "gitcommit", "gitrebase", "gitsendemail",
      "vista", "vista_*",
    },
    callback = function()
      vimrc.util.buf.make_ephemeral(0,0)
      vimrc.util.buf.disable_extras(0,0)
    end,
  })

define_autocommand("SwapExists", {
    match = {"* nested"},
    callback = function()
      vim.v.swapchoice = 'o' -- automatically select readonly when swap exists.
    end,
  })

define_autocommand("TextYankPost", { callback = function() 
  require'vim.highlight'.on_yank()  -- requires nvim 0.5.0+
end })

vim.cmd("augroup END") -- close the autogroup (at end of file).
