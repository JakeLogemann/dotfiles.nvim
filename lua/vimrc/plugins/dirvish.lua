vim.g.loaded_netrwPlugin = 1 -- disable netrw (if not already loaded/disabled).
-- replace netrw commands with dirvish.
vim.cmd('command! -nargs=? -complete=dir Explore Dirvish <args>')
vim.cmd('command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>')
vim.cmd('command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>')
