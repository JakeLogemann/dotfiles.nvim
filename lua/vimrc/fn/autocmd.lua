local vimrc = _G["vimrc"]

function vimrc.fn.define_autocommand(name, opts)
  local callback = opts.callback
  local match = opts.match or {'*'}

  if vimrc.autocmd == nil then vimrc.autocmd = {} end
  vimrc.autocmd[name] = callback
  vim.cmd(string.format("autocmd %s %s lua vimrc.autocmd['%s']()",
    table.concat((opts.events or { name }),','),
    table.concat(match, ','),
    name))
end


function vimrc.fn.autocommand_group(name, fn)
  vim.api.nvim_command("augroup "..name)
  vim.api.nvim_command("autocmd!")
  fn()
  vim.api.nvim_command("augroup end")
end

