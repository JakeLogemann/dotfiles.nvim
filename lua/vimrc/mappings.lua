local vimp = require('vimp')
local util = require('vimrc.util')
vimp.unmap_all() -- Remove all previously added maps.
vimp.add_chord_cancellations('n', '<leader>') -- cancel chords when leader is pressed in normal mode.
local opts = {"override", "nowait"}
local opts_expr = {"expr", "override", "nowait"}

local mapping_tbl = {
  { comment = "goto window below", keys    = {"<C-j>"}, command = '<C-w>j', modes   = "nx" },
  { comment = "goto window above", keys    = {"<C-k>"}, command = '<C-w>k', modes   = "nx" },
  { comment = "goto window left", keys    = {"<C-h>"}, command = '<C-w>h', modes   = "nx" },
  { comment = "goto window right", keys    = {"<C-k>"}, command = '<C-w>l', modes   = "nx" },
  { comment = "save current buffer", keys    = {"<C-s>"}, command = '<cmd>write<cr>', modes   = "nx" },
  { comment = "sbnext", command = '<cmd>sbnext<cr>', keys = {"<F8>"},   modes = "nx" },
  { comment = "sbprev", command = '<cmd>sbprev<cr>', keys = {"<S-F8>"}, modes = "nx" },
  { comment = "lwindow", command = '<cmd>lwindow<cr>', keys = {"<F5>"}, modes = "nx" },

  { comment = "toggle file tree",
    command = '<cmd>LuaTreeToggle<cr>',
    keys    = {"<C-e>", "<leader>e"},
    modes   = "nx" },
}

local mapping_groups = {
  find = {
    prefix = '<leader>f',
    command = '<cmd>lua vimrc.find.%s()<cr>',
    mappings = {
        f = 'file',
        h = 'help_tag',
        r = 'lsp_reference',
        s = 'lsp_workspace_symbol',
        S = 'lsp_document_symbol',
        g = 'grep',
        x = 'command',
        X = 'command_in_history',
        b = 'buffer',
        v = 'neovim_config',
      },
  },
  git = {
    prefix = '<leader>g',
    command = '<cmd>Gina %s<cr>',
    modes = "nx",
    mappings = {
        s = 'status',
        C = 'commit',
        B = 'blame',
        b = 'branch',
      },
  },
  buffer = {
    prefix = '<leader>b',
    modes = "nx",
    mappings = {
        b = 'lua vimrc.modals.buffer_mode()',
        n = 'bNext',
        p = 'bprevious',
        l = 'buffers',
        d = 'bdelete',
      },
  },
  tab = {
    prefix = '<leader>T',
    modes = "nx",
    mappings = {
        n = 'tabNext',
        p = 'tabprevious',
        l = 'tabs',
        d = 'tabclose',
      },
  },
  toggle = {
    prefix = '<leader>z',
    command = "<cmd>lua vimrc.util.%s<cr>",
    mappings = {
        n = 'win.toggle_option("number")',
        w = 'win.toggle_option("wrap")',
        s = 'win.toggle_option("spell")',
        l = 'win.toggle_option("list")',
        r = 'buf.toggle_option("readonly")',
      },
  },
  reload = {
    prefix = '<leader>r',
    command = "<cmd>luafile "..vim.g.vimrc_config_dir.."/lua/vimrc/%s.lua<cr>",
    mappings = {
        c = 'colors',
        m = 'mappings',
        s = 'statusline',
        A = 'apis',
        f = 'find',
        d = 'diags',
        i = 'init',
        o = 'options',
        a = 'autocommands',
        u = 'util/init',
      },
  },
}

-- generate a mapping for each mapping group above.
for group_name, group in pairs(mapping_groups) do
  for key, cmd in pairs(group.mappings) do
    local mapping = { 
      comment = string.format((group.comment or group_name..' %s'), cmd),
      command = string.format((group.command or '<cmd>%s<cr>'), cmd) ,
      keys    = {(group.prefix or '')..key},
      modes   = (group.modes or "nx"),
    }
    -- insert the mapping into the global table.
    table.insert(mapping_tbl, mapping)
  end
end

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
vimp.rbind('nx', opts, {'<leader>t'}, ':Vista!!<cr>')
vimp.rbind('nx', opts, {'<Esc><Esc>'}, ':noh<cr>')
vimp.rbind('t',  opts, {'<Esc><Esc>'}, '<C-\\><C-n>')
vimp.rbind('nx', opts, {'<leader>d'}, "<cmd>luafile "..vim.g.vimrc_config_dir.."/lua/vimrc/diags.lua<cr>")
vimp.rbind('nx', opts, {'gd'}, "<cmd>lua vim.lsp.buf.declaration()<cr>")
vimp.rbind('nx', opts, {'gD'}, "<cmd>lua vim.lsp.buf.implementation()<cr>")
vimp.rbind('nx', opts, {'K'}, "<cmd>lua vim.lsp.buf.hover()<cr>")
vimp.rbind('nx', opts, {'<C-]>'}, "<cmd>lua vim.lsp.buf.definition()<cr>")
--vimp.rbind('nx', opts, {'<C-k>'}, "<cmd>lua vim.lsp.buf.signature_help()<cr>")
vimp.rbind('nx', opts, {'1gD'}, "<cmd>lua vim.lsp.buf.type_definition()<cr>")
vimp.rbind('nx', opts, {'gr'}, "<cmd>lua vim.lsp.buf.references()<cr>")
vimp.rbind('nx', opts, {'g0'}, "<cmd>lua vim.lsp.buf.document_symbol()<cr>")
vimp.rbind('nx', opts, {'gW'}, "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>")

vimp.nnoremap('<leader>v', function()
  local cur_buf = vim.api.nvim_get_current_buffer()
  dbg(cur_buf)
end)

vim.cmd [[ inoremap <silent><expr> <C-Space> pumvisible() ? "\<C-n>" : completion#trigger_completion() ]]
vim.cmd [[ cnoremap <C-A> <Home> ]] -- start of line.
vim.cmd [[ cnoremap <C-B> <Left> ]] -- back 1 char.
vim.cmd [[ cnoremap <C-D> <Del> ]] -- delete under cursor.
vim.cmd [[ cnoremap <C-E> <End> ]] -- end of line.
vim.cmd [[ cnoremap <C-F> <Right> ]] -- forward 1 char.
vim.cmd [[ cnoremap <C-N> <Down> ]] -- next command in history.
vim.cmd [[ cnoremap <C-P> <Up> ]] -- prev command in history.
vim.cmd [[ cnoremap <Esc><C-B> <S-Left> ]] -- back one word.
vim.cmd [[ cnoremap <Esc><C-F> <S-Right> ]] -- forward one word.
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
  groups = mapping_groups,
}
-- vim: ft=lua
