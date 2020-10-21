local win = {}

function win.is_open(winnr)
    if not winnr then winnr = 0 end
    return vim.api.nvim_win_is_valid(winnr) 
end

function win.is_current(winnr)
    local cur_win = vim.api.nvim_get_current_win()
    return cur_win == (winnr or 0)
end

function win.try_close(winnr)
    if not winnr then winnr = 0 end
    if vim.api.nvim_win_is_valid(winnr) then
      vim.api.nvim_win_close(winnr, true)
    end
end

function win.focus(winnr)
  if win.is_open(winnr) and not win.is_current(winnr) then
    vim.api.nvim_set_current_win(winnr)
  end
end

_G.vimrc.util.win = win

