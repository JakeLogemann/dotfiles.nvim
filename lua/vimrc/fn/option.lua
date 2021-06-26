local vimrc = _G["vimrc"]

-- toggles a named option, outputing its new value for a better UX.
--
-- @option_name name of the vim option to be toggled on or off.
function vimrc.fn.toggle_option(option_name)
  local current = vim.api.nvim_get_option(option_name) or false
  local new_val = not current
  vim.api.nvim_set_option(option_name, new_val)
  print("SET " .. option_name .. " = " .. (new_val and "ON" or "OFF"))
end

-- toggles a named option, outputing its new value for a better UX.
function vimrc.fn.toggle_option(option_name)
  local current = vim.api.nvim_get_option(option_name) or false
  local new_val = not current
  vim.api.nvim_set_option(option_name, new_val)
  print("SET " .. option_name .. " = " .. (new_val and "ON" or "OFF"))
end

