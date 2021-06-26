local vimp = require('vimp')
local vimrc = _G["vimrc"]
vimp.unmap_all() -- Remove all previously added maps.
vimp.add_chord_cancellations('n', '<leader>') -- cancel chords when leader is pressed in normal mode.
local opts = {"override", "nowait"}
local opts_expr = {"expr", "override", "nowait"}
local which_key_leader_map = vim.empty_dict()

-- command_mappings are mappings defined with their related commands. they are bound in normal/command mode, only.
local command_mappings = vimrc.fn.deep_table()

local function command_mapping(ident, opts)
  local mapping_modes = opts.mapping_modes or {'n', 'x'}
  local bind = opts.bind or { }
  local cmd = opts.cmd or 'echoerr "Not Implemented"' 

  _G.vimrc.autocmd[name] = callback
  vim.cmd(string.format("autocmd %s %s lua require'vimrc'.autocmd['%s']()",
    table.concat((opts.events or { name }),','),
    table.concat(match, ','),
    name))
end



which_key_leader_map["e"] = { '<CMD>NvimTreeToggle\\<CR>', 'filetree' }
which_key_leader_map["t"] = { '<CMD>Vista!!\\<CR>', 'tagtree' }
-- which_key_leader_map["d"] = { '<CMD>luafile '..vim.g.vimrc_config_dir..'/lua/vimrc/diags.lua\\<CR>', 'diagnostics' }
which_key_leader_map["f"] = {
  ["name"] = "+find",
  f = { '<CMD>lua vimrc.find.file()\\<CR>', 'file' },
  h = { '<CMD>lua vimrc.find.help()\\<CR>', 'help' },
  r = { '<CMD>lua vimrc.find.reference()\\<CR>', 'lsp-ref' },
  s = { '<CMD>lua vimrc.find.workspace_symbol()\\<CR>', 'lsp-sym' },
  S = { '<CMD>lua vimrc.find.document_symbol()\\<CR>', 'doc-sym' },
  g = { '<CMD>lua vimrc.find.grep()\\<CR>', 'grep' },
  x = { '<CMD>lua vimrc.find.command()\\<CR>', 'cmd' },
  X = { '<CMD>lua vimrc.find.recent_command()\\<CR>', 'cmd-hist' },
  b = { '<CMD>lua vimrc.find.buffer()\\<CR>', 'buf' },
  v = { '<CMD>lua vimrc.find.neovim_config()', 'nvim-cfg' },
}

which_key_leader_map["g"] = {
  ["name"] = "+git",
  s = { '<CMD>Gina status\\<CR>', 'status' },
  C = { '<CMD>Gina commit\\<CR>', 'commit' },
  B = { '<CMD>Gina blame\\<CR>', 'blame' },
  b = { '<CMD>Gina branch\\<CR>', 'branch' },
}

which_key_leader_map["b"] = {
  ["name"] = "+buffer",
  f = { '<CMD>lua vimrc.find.buffer()\\<CR>', 'find' },
  n = { '<CMD>bNext\\<CR>', 'next' },
  p = { '<CMD>bprevious\\<CR>', 'previous' },
  l = { '<CMD>buffers\\<CR>', 'list' },
  d = { '<CMD>bdelete\\<CR>', 'delete' },
}

which_key_leader_map["t"] = {
  ["name"] = "+tab",
  n = { '<CMD>tabNext\\<CR>', 'next' },
  p = { '<CMD>tabprevious\\<CR>', 'previous' },
  l = { '<CMD>tabs\\<CR>', 'list' },
  d = { '<CMD>tabclose\\<CR>', 'close' },
  N = { '<CMD>tabnew\\<CR>', 'new' },
}

which_key_leader_map["z"] = {
  ["name"] = "+toggle",
  n = { '<CMD>lua vimrc.fn.toggle_window_option("number")\\<CR>', 'number' },
  w = { '<CMD>lua vimrc.fn.toggle_window_option("wrap")\\<CR>', 'wrap' },
  s = { '<CMD>lua vimrc.fn.toggle_window_option("spell")\\<CR>', 'spell' },
  l = { '<CMD>lua vimrc.fn.toggle_window_option("list")\\<CR>', 'list' },
  r = { '<CMD>lua vimrc.fn.toggle_window_option("readonly")\\<CR>', 'readonly' },
}

-- Quickly reload.
which_key_leader_map["r"] = { 
  ["name"] = "+reload";
  n = { '<CMD>lua vimrc.fn.reload()\\<CR>', 'reload()' };
}

for k,fname in pairs({
    c = 'colors',
    m = 'mappings',
    s = 'statusline',
    A = 'apis',
    f = 'find',
    F = 'fn/init',
    i = 'init',
    o = 'options',
    a = 'autocommands',
  }) do
  which_key_leader_map["r"][k] = {
    '<CMD>luafile '.. vim.fn.stdpath('config') ..'/lua/vimrc/'..fname..'.lua\\<CR>', 
    fname,
  }
end

-- Register Group Mappings into WhichKey's leader map...
vim.g.which_key_leader_map = which_key_leader_map
vim.fn.call('which_key#register', {'<Space>', "g:which_key_leader_map"})


local mapping_tbl = {
  { comment = "goto window below",        command = '<C-w>j',                  keys = {"<C-j>"},     modes = "nx" },
  { comment = "goto window above",        command = '<C-w>k',                  keys = {"<C-k>"},     modes = "nx" },
  { comment = "goto window left",         command = '<C-w>h',                  keys = {"<C-h>"},     modes = "nx" },
  { comment = "goto window right",        command = '<C-w>l',                  keys = {"<C-k>"},     modes = "nx" },
  { comment = "save current buffer",      command = '<cmd>write<cr>',          keys = {"<C-s>"},     modes = "nx" },
  { comment = "sbnext",                   command = '<cmd>sbnext<cr>',         keys = {"<F8>"},      modes = "nx" },
  { comment = "sbprev",                   command = '<cmd>sbprev<cr>',         keys = {"<S-F8>"},    modes = "nx" },
  { comment = "lwindow",                  command = '<cmd>lwindow<cr>',        keys = {"<F5>"},      modes = "nx" },
  { comment = "start of line",            command = '<Home>',                  keys = {"<C-A>"},     modes = "c"  },
  { comment = "end of line",              command = '<End>',                   keys = {"<C-E>"},     modes = "c"  },
  { comment = "delete char under cursor", command = '<C-D>',                   keys = {"<Del>"},     modes = "c"  },
  { comment = "back 1 char",              command = '<C-B>',                   keys = {"<Left>"},    modes = "c"  },
  { comment = "forward 1 char",           command = '<C-F>',                   keys = {"<Right>"},   modes = "c"  },
  { comment = "previous command",         command = '<C-P>',                   keys = {"<Up>"},      modes = "c"  },
  { comment = "next command",             command = '<C-N>',                   keys = {"<Down>"},    modes = "c"  },
  { comment = "leader key hints",         command = '<cmd>WhichKey! g:which_key_leader_map<cr>', keys = {"<leader>"}, modes = "nx" },
}


-- -- generate a mapping for each mapping group above.
-- for group_name, group in pairs(mapping_groups) do
--   for key, cmd in pairs(group.mappings) do
--     local mapping = { 
--       comment = string.format((group.comment or group_name..' %s'), cmd),
--       command = string.format('<leader>' .. (group.command or '<cmd>%s<cr>'), cmd) ,
--       keys    = {(group.prefix or '')..key},
--       modes   = (group.modes or "nx"),
--     }
--     -- insert the mapping into the global table.
--     table.insert(mapping_tbl, mapping)
--   end
-- end
-- 
-- generate vimpeccable bindings for each mapping defined above.
for _, mapping in pairs(mapping_tbl) do
  vimp.rbind(
    (mapping.modes or 'nx'), 
    (mapping.opts or opts), 
    mapping.keys, 
    mapping.command)
end

vimp.rbind('i',  opts_expr, {'<Tab>'}, 'pumvisible() ? "\\<C-n>" : "\\<Tab>"')
vimp.rbind('i',  opts_expr, {'<S-Tab>'}, 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"')
vimp.rbind('i',  opts_expr, {'<C-Space>'}, '<Plug>(completion_trigger)')
vimp.rbind('nx', opts, {'<Esc><Esc>'}, ':noh<cr>')
vimp.rbind('t',  opts, {'<Esc><Esc>'}, '<C-\\><C-n>')
vimp.rbind('nx', opts, {'gd'}, "<cmd>lua vim.lsp.buf.declaration()<cr>")
vimp.rbind('nx', opts, {'gD'}, "<cmd>lua vim.lsp.buf.implementation()<cr>")
vimp.rbind('nx', opts, {'K'}, "<cmd>lua vim.lsp.buf.hover()<cr>")
vimp.rbind('nx', opts, {'<C-]>'}, "<cmd>lua vim.lsp.buf.definition()<cr>")
--vimp.rbind('nx', opts, {'<C-k>'}, "<cmd>lua vim.lsp.buf.signature_help()<cr>")
vimp.rbind('nx', opts, {'1gD'}, "<cmd>lua vim.lsp.buf.type_definition()<cr>")
vimp.rbind('nx', opts, {'gr'}, "<cmd>lua vim.lsp.buf.references()<cr>")
vimp.rbind('nx', opts, {'g0'}, "<cmd>lua vim.lsp.buf.document_symbol()<cr>")
vimp.rbind('nx', opts, {'gW'}, "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>")

vim.cmd [[ inoremap <silent><expr> <C-Space> pumvisible() ? "\<C-n>" : completion#trigger_completion() ]]
-- 
-- " Release keymappings prefixes, evict entirely for use of plug-ins.
-- nnoremap <Space>  <Nop>
-- xnoremap <Space>  <Nop>
-- nnoremap ,        <Nop>
-- xnoremap ,        <Nop>
-- nnoremap \        <Nop>
-- xnoremap \        <Nop>
-- 


_G.vimrc.mappings = {
  tbl = mapping_tbl,
  cm = command_mappings,
  groups = mapping_groups,
}
-- vim: ft=lua
