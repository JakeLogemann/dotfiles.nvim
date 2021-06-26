local vimrc = _G["vimrc"]

-- render a penlight template using a standardized context.
--
-- @template text to render with template context
function vimrc.fn.render_template(template)
  return pl.stringx.splitlines(pl.template.substitute(template, {
    vimrc = vimrc,
    vim = vim,
    plenary = require'plenary',
    pl = require'pl',
    icon = require'nvim-web-devicons',
  }))
end

