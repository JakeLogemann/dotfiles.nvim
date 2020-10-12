local M = {}

function M.setup()
  vimp.add_buffer_maps(function()
    vimp.nnoremap('<leader>t1', function() print('lua map!') end)
    vimp.nnoremap('<leader>t2', function() print('lua map two!') end)
  end)
end

-- automatically call the setup function on lua filetypes.
vim.cmd('autocmd FileType lua lua require("vimrc/ft/lua").setup()')

return M
