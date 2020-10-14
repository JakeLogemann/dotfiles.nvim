local util = {}

function util.secret_from_pass(secret_name) 
  -- return the output of a given secret from `pass`.
  return vim.fn.system("pass show " .. secret_name) 
end

util['unload_lua_namespace'] = function(prefix)
  local prefix_with_dot = prefix .. '.'
  for key, value in pairs(package.loaded) do
    if key == prefix or key:sub(1, #prefix_with_dot) == prefix_with_dot then
      package.loaded[key] = nil
    end
  end
end

function util.autodelete_bufnr_on_leave(bufnr)
  -- autocommand to automatically close/delete a buffer when its left.
  vim.cmd("autocmd WinLeave <buffer> silent! execute 'bdelete! ".. bufnr .."'")
end

function util.random_string(length)
  -- generate a random string of arbitrary length.
  if not length or length <= 0 then return '' end
  math.randomseed(os.clock()^5)
  return util.random_string(length - 1) .. charset[math.random(1, #charset)]
end

function util.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

-- Turn some special character value into a character code.
function util.to_char(val) return eval('"\\'..val..'"') end

function util.new_win()
  vim.api.nvim_open_win(0, false, {
    relative='win',
    width=12,
    height=3,
    bufpos={100,10}
  })
end

function util.create_win()
  -- We save handle to window from which we open the navigation
  start_win = vim.api.nvim_get_current_win()

  vim.api.nvim_command('botright vnew') -- We open a new vertical window at the far right
  win = vim.api.nvim_get_current_win() -- We save our navigation window handle...
  buf = vim.api.nvim_get_current_buf() -- ...and it's buffer handle.

  -- We should name our buffer. All buffers in vim must have unique names.
  -- The easiest solution will be adding buffer handle to it
  -- because it is already unique and it's just a number.
  vim.api.nvim_buf_set_name(buf, 'Oldfiles #' .. buf)

  -- Now we set some options for our buffer.
  -- nofile prevent mark buffer as modified so we never get warnings about not saved changes.
  -- Also some plugins treat nofile buffers different.
  -- For example coc.nvim don't triggers aoutcompletation for these.
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  -- We do not need swapfile.
  vim.api.nvim_buf_set_option(buf, 'swapfile', false)
  -- And we would rather prefer that buffer will be destroyed when hide.
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  -- It's not necessary but it is good practice to set custom filetype.
  -- This allows users to create their own autocommand or colorschemes on filetype.
  -- and prevent collisions with other plugins.
  vim.api.nvim_buf_set_option(buf, 'filetype', 'nvim-oldfile')

  -- For better UX we will turn off line wrap and turn on current line highlight.
  vim.api.nvim_win_set_option(win, 'wrap', false)
  vim.api.nvim_win_set_option(win, 'cursorline', true)

  set_mappings() -- At end we will set mappings for our navigation.
end

function util.load_env_file(dir_path)
  local env_contents = {}
  local env_file = dir_path .. '/.env'

  if vim.fn.filereadable(env_file) ~= 1 then
    print('.env file does not exist')
    return
  end

  local contents = vim.fn.readfile(env_file)
  for _,item in pairs(contents) do
    local line_content = vim.fn.split(item,"=")
    env_contents[line_content[1]] = line_content[2]
  end
  return env_contents
end

return util 
