local AC = {

  InsertEnter = function() 
    vim.api.nvim_win_set_option(0, 'cursorline', false)
    vim.api.nvim_win_set_option(0, 'cursorcolumn', false)
    vim.api.nvim_win_set_option(0, 'list', false)
    return true 
  end,

  CursorHold = function() 
    vim.api.nvim_win_set_option(0, 'cursorline', false)
    vim.api.nvim_win_set_option(0, 'cursorcolumn', false)
    vim.api.nvim_win_set_option(0, 'list', false)
    return true 
  end,

  CursorMoved = function() 
    vim.api.nvim_win_set_option(0, 'cursorline', true)
    vim.api.nvim_win_set_option(0, 'cursorcolumn', true)
    return true 
  end,

  InsertLeave = function() 
    vim.api.nvim_win_set_option(0, 'list', true) 
    vim.api.nvim_win_set_option(0, 'cursorline', true)
    vim.api.nvim_win_set_option(0, 'cursorcolumn', true)
    return true 
  end,

  WinEnter = function() 
    return true 
  end,

  WinLeave = function() 
    return true 
  end,

  BufEnter = function() 
    return true 
  end,

  BufLeave = function() 
    return true 
  end,

  BufReadPre = function() 
    return true 
  end,
  
  BufReadPost = function() 
    return true 
  end,
}

-- define an autogroup from the above function(s).
vim.cmd("augroup LuaVimrc")
vim.cmd("autocmd!") -- clear previous settings
for name,_ in pairs(AC) do
  vim.cmd("autocmd ".. name .." " .. "lua require'vimrc.autocommands'." .. name .. "()")
end
vim.cmd("augroup END")
-- return the autocommand functions for calling from the maps.
_G.vimrc.autocommands = AC
