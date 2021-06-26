local vimrc = _G["vimrc"]

function vimrc.fn.load_env(env_file)
  local env_contents = {}

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

function vimrc.fn.unload_lua_namespace(prefix)
  local prefix_with_dot = prefix .. '.'
  for key, value in pairs(package.loaded) do
    if key == prefix or key:sub(1, #prefix_with_dot) == prefix_with_dot then
      package.loaded[key] = nil
    end
  end
end

function vimrc.fn.secret_from_pass(secret_name) 
  -- return the output of a given secret from `pass`.
  return vim.fn.system("pass show " .. secret_name) 
end


