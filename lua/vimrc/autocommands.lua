local vimrc = _G["vimrc"]

vimrc.fn.autocommand_group("LuaVimrc", function()

  -- https://vim.fandom.com/wiki/Detect_window_creation_with_WinEnter
  vim.cmd("autocmd VimEnter * autocmd WinEnter * let w:created=1")


  -- define_autocommand("BufEnter", { callback = function()
        --   -- require'completion'.on_attach()
    -- end })

  vimrc.fn.define_autocommand("BufWritePre", {
      callback = function()
      end,
    })

  vimrc.fn.define_autocommand("InsertEnter", { callback = function()
    vim.cmd('noh') -- disable highlight
  end })

  vimrc.fn.define_autocommand("InsertLeave", { callback = function()
    vim.o.paste = false
    vim.cmd('noh') -- disable highlight
  end })

  vimrc.fn.define_autocommand("VimLeave", { callback = function()
    vim.cmd('wshada!') -- ensure ShaDa file is written before exit.
  end })

  vimrc.fn.define_autocommand("VimEnter", {
      callback = function()
        vim.cmd("NvimTreeOpen")
        vim.defer_fn(function() print("Welcome to my NeoVim!") end, 1000)
        vim.defer_fn(function() vim.cmd("NvimTreeOpen") end, 1500)
        vim.defer_fn(function() print("Lets see if this works ...") end, 2500)
        vim.defer_fn(function() print(" ") end, 4000)
      end })


    vimrc.fn.define_autocommand("RefFileTypes", {
        events = {"FileType"},
        match = {"help"},
        callback = function()
          vimrc.util.buf.disable_extras(0,0)
        end })

    vimrc.fn.define_autocommand("EphemeralFileTypes", {
        events = {"FileType"},
        match = {
          "LuaTree",
          "gina-*",
          "git", "gitcommit", "gitrebase", "gitsendemail",
          "vista", "vista_*",
        },
        callback = function()
          vimrc.util.buf.make_ephemeral(0,0)
          -- vimrc.util.buf.disable_extras(0,0)
        end })

    vimrc.fn.define_autocommand("SwapExists", {
        match = {"* nested"},
        callback = function()
          vim.v.swapchoice = 'o' -- automatically select readonly when swap exists.
        end })

    vimrc.fn.define_autocommand("TextYankPost", { callback = function()
      require'vim.highlight'.on_yank()  -- requires nvim 0.5.0+
    end })

  end)
