local el = require('el')
local bufferline = require('bufferline')
local helper = require("el.helper")
local sections = require("el.sections")
local extensions = require('el.extensions')
local builtin = require('el.builtin')
local subscribe = require('el.subscribe')
local lsp_statusline = require('el.plugins.lsp_status')

el.setup({
    generator = function(win_id)
      return {
        extensions.gen_mode { format_string = ' [%s]' },
        subscribe.buf_autocmd(
          "el_git_branch",
          "BufEnter",
          function(window, buffer)
            local branch = extensions.git_branch(window, buffer)
            if branch then
              return ' ' .. extensions.git_icon() .. ' ' .. branch
            end
          end
          ),
        sections.split,
        builtin.responsive_file(140, 90),
        sections.split,
        lsp_statusline.current_function,
        lsp_statusline.server_progress,
        sections.collapse_builtin({
          builtin.quickfix,
          builtin.locationlist,
          builtin.modified,
          builtin.help,
          builtin.preview,
          builtin.readonly,
        }),
        subscribe.buf_autocmd("el_file_type", "BufRead", function(win, buf)
          local icon = extensions.file_icon(_, buf)
          if not icon then icon = '' end
          return string.format(" %s %s", icon, builtin.filetype)
        end),
        subscribe.buf_autocmd("el_git_changes", "BufWritePost", function(window, buffer)
            return extensions.git_changes(window, buffer)
          end),
        '[', builtin.line, ':',  builtin.column, ']',
      }
    end
  })


bufferline.setup({
  options = {
    view = "default", --"multiwindow" | "default"
    numbers = "ordinal", -- | "none" | "ordinal" | "buffer_id"
    number_style = "",
    mappings = true,
    close_icon = "x",
    max_name_length = 20,
    tab_size = 20,
    show_buffer_close_icons = false,
    separator_style = "thick", -- "thick" | "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  }
})
