
_G["paq"]({'Iron-E/nvim-libmodal', as = 'libmodal.nvim' })

local api = vim.api
local M = { modes = {} } -- define module to be returned.

-- Function which is called whenever the user presses a button in ReloadMode
local function reloadMode()
  -- Append to the input history, the latest button press.
  -- The input is a character number.
  local userInput = string.char(api.nvim_get_var('reloadModeInput'))

  if userInput == '' then
    api.nvim_command("echom 'You cant leave using <Esc>.'")
  elseif userInput == 'q' then
    -- If the user presses 'q', libmodal will exit the mode.
    api.nvim_set_var('fooModeExit', true)
  end
end

local bufferMode = {
  ['n']    = 'bNext',
  ['f']    = "<cmd>lua vimrc.finders.buffer()<cr>",
  ['x']    = 'bclose',
  ['X']    = 'bdelete',
  ['p']    = 'bprevious',
  ['c']    = 'enew',
  ['exit'] = libmodal.utils.api.mode_exit,
}

local tabMode = {
  ['n']    = 'tabNext',
  ['x']    = 'tabclose',
  ['1']    = 'tabfirst',
  ['0']    = 'tablast',
  ['p']    = 'tabprevious',
  ['c']    = 'tabnew',
  ['exit'] = libmodal.utils.api.mode_exit,
}


vim.api.nvim_set_var('reloadModeExit', 0)
vim.api.nvim_set_var('bufferModeExit', 0)
vim.api.nvim_set_var('tabModeExit', 0)

M.modes.reload = function() libmodal.mode.enter('Reload', reloadMode, true) end
M.modes.buffer = function() libmodal.mode.enter('BUFFER', bufferMode) end
M.modes.tab    = function() libmodal.mode.enter('TAB', tabMode) end

_G.vimrc.modes = M.modes
return M
