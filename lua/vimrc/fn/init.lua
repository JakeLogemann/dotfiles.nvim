local vimrc = _G["vimrc"]
vimrc.fn.setup = {}

function vimrc.fn.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

-- bounds given number value between min and max.
--
-- @value target value to modify.
-- @min minimum acceptable value.
-- @max maximum acceptable value.
function vimrc.fn.bounded(value, min, max)
  min = min or 0
  max = max or math.huge

  if min then value = math.max(value, min) end
  if max then value = math.min(value, max) end

  return value
end


