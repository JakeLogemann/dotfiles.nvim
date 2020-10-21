_G.vimrc.statusline = _G.vimrc.statusline or {}

local el = require('el')
local helper = require("el.helper")
local sections = require("el.sections")
local extensions = require('el.extensions')
local builtin = require('el.builtin')
local subscribe = require('el.subscribe')
local lsp_statusline = require('el.plugins.lsp_status')

local file_info = function()
    local name = "el_file_info"
    local matched_events = {"BufEnter","BufReadPost"}
    local render = function(window, buffer)
        local name = vim.fn.fnamemodify(buffer.name, ':t')
        local icon = (extensions.file_icon(window, buffer) or '')
        local readonly = (icons.get_icon("lock") or '')
        local branch = (extensions.git_branch(window, buffer) or '')
        return table.concat({ "", icon, name, readonly, branch, "" }, " ")
    end
    return subscribe.buf_autocmd(name, table.concat(matched_events, ","), render)
end

_G.vimrc.statusline.setup = function()
  el.setup({
    generator = function(winnr)
      local line = {}
      local bufnr = vim.api.nvim_win_get_buf(winnr)
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      local bufft = vim.api.nvim_buf_get_option(bufnr, 'filetype')

      -- left section:
      table.insert(line, extensions.gen_mode({ format_string = ' %s ' }))
      table.insert(line, file_info())

      table.insert(line, sections.split) -- end of left section

      -- center section:

      table.insert(line, sections.split) -- end of center section

      -- right section:

      -- table.insert(line, subscribe.buf_autocmd("el_git_changes", "BufWritePost", function(window, buffer)
      --   return extensions.git_icon() .. extensions.git_changes(window, buffer)
      -- end))

      table.insert(line, lsp_statusline.current_function)
      table.insert(line, lsp_statusline.server_progress)

      table.insert(line, sections.collapse_builtin({
        builtin.quickfix,
        builtin.locationlist,
        builtin.modified,
        builtin.help,
        builtin.preview,
        builtin.readonly,
      }))

      return line
    end
  })


  require'bufferline'.setup({
    options = {
      view = "default", --"multiwindow" | "default"
      numbers = "ordinal", -- | "none" | "ordinal" | "buffer_id"
      number_style = "",
      mappings = true,
      close_icon = "x",
      max_name_length = 20,
      tab_size = 20,
      show_buffer_close_icons = true,
      separator_style = "thick", -- "thick" | "thin",
      enforce_regular_tabs = false,
      always_show_bufferline = false,
    }
  })

end

_G.vimrc.statusline.setup()
