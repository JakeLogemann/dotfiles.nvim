paq "tjdevries/express_line.nvim"

vimrc.statusline = {}

local el = require('el')
el.helper = require("el.helper")
el.sections = require("el.sections")
el.extensions = require('el.extensions')
el.builtin = require('el.builtin')
el.subscribe = require('el.subscribe')
local lsp_status = require('el.plugins.lsp_status')

local file_info = function()
    local name = "el_file_info"
    local matched_events = {"BufEnter","BufReadPost"}
    local render = function(window, buffer)
        local name = vim.fn.fnamemodify(buffer.name, ':t')
        local icon = (el.extensions.file_icon(window, buffer) or '')
        local readonly = 'RO'
        local branch = (el.extensions.git_branch(window, buffer) or '')
        return table.concat({ "", icon, name, readonly, branch, "" }, " ")
    end
    return el.subscribe.buf_autocmd(name, table.concat(matched_events, ","), render)
end


local function generator(winnr)
  local line = {}
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  local bufft = vim.api.nvim_buf_get_option(bufnr, 'filetype')

  -- left section:
  table.insert(line, el.extensions.gen_mode({ format_string = ' %s ' }))
  table.insert(line, file_info())

  table.insert(line, el.sections.split) -- end of left section

  -- center section:

  table.insert(line, el.sections.split) -- end of center section

  -- right section:

  -- table.insert(line, subscribe.buf_autocmd("el_git_changes", "BufWritePost", function(window, buffer)
  --   return extensions.git_icon() .. extensions.git_changes(window, buffer)
  -- end))

  table.insert(line, lsp_status.current_function)
  table.insert(line, lsp_status.server_progress)

  table.insert(line, el.sections.collapse_builtin({
    el.builtin.quickfix,
    el.builtin.locationlist,
    el.builtin.modified,
    el.builtin.help,
    el.builtin.preview,
    el.builtin.readonly,
  }))

  return line
end

function vimrc.statusline.setup()
  el.setup({
      generator = generator;
  })


-- require'bufferline'.setup({
--   options = {
--     view = "default", --"multiwindow" | "default"
--     numbers = "ordinal", -- | "none" | "ordinal" | "buffer_id"
--     number_style = "",
--     mappings = true,
--     close_icon = "x",
--     max_name_length = 20,
--     tab_size = 20,
--     show_buffer_close_icons = true,
--     separator_style = "thick", -- "thick" | "thin",
--     enforce_regular_tabs = false,
--     always_show_bufferline = false,
--   }
-- })

end

