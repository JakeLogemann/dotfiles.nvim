local vimp = require('vimp')
local util = require('vimrc.util')
vimp.unmap_all() -- Remove all previously added maps.
vimp.add_chord_cancellations('n', '<leader>') -- cancel chords when leader is pressed in normal mode.
local opts = {"override", "nowait"}
local opts_expr = {"expr", "override", "nowait"}

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
        o = 'options/init',
        a = 'autocommands',
        u = 'util/init',
      },
  },
}

local which_key_leader_map = {
  b = {
    name = '+buffer' ,
    ['?'] = {'Buffers'   , 'fzf-buffer'}      ,
    [1] = {'b1'        , 'buffer 1'}        ,
    [2] = {'b2'        , 'buffer 2'}        ,
    d = {'bd'        , 'delete-buffer'}   ,
    f = {'bfirst'    , 'first-buffer'}    ,
    h = {'Startify'  , 'home-buffer'}     ,
    l = {'blast'     , 'last-buffer'}     ,
    n = {'bnext'     , 'next-buffer'}     ,
    p = {'bprevious' , 'previous-buffer'} ,
  },

  f = {
    name = '+find',
    f = {'<cmd>lua vimrc.find.file<cr>', 'file'},
    h = {'<cmd>lua vimrc.find.help_tag<cr>', 'help tag'},
    r = {'<cmd>lua vimrc.find.lsp_reference<cr>', 'lsp ref'},
    s = {'<cmd>lua vimrc.find.lsp_workspace_symbol<cr>', 'workspace sym'},
    S = {'<cmd>lua vimrc.find.lsp_document_symbol<cr>', 'document sym'},
    g = {'<cmd>lua vimrc.find.grep<cr>', 'grep'},
    x = {'<cmd>lua vimrc.find.command<cr>', 'command'},
    X = {'<cmd>lua vimrc.find.command_in_history<cr>', 'command hist'},
    b = {'<cmd>lua vimrc.find.buffer<cr>', 'buffer'},
    v = {'<cmd>lua vimrc.find.neovim_config<cr>', 'nvim cfg'},
  },

}

-- vim.fn.call('which_key#register', ' ', "g:which_key_leader_map")

local mapping_tbl = {
  { comment = "goto window below",        command = '<C-w>j',                 keys = {"<C-j>"},     modes = "nx" },
  { comment = "goto window above",        command = '<C-w>k',                 keys = {"<C-k>"},     modes = "nx" },
  { comment = "goto window left",         command = '<C-w>h',                 keys = {"<C-h>"},     modes = "nx" },
  { comment = "goto window right",        command = '<C-w>l',                 keys = {"<C-k>"},     modes = "nx" },
  { comment = "save current buffer",      command = '<cmd>write<cr>',         keys = {"<C-s>"},     modes = "nx" },
  { comment = "sbnext",                   command = '<cmd>sbnext<cr>',        keys = {"<F8>"},      modes = "nx" },
  { comment = "sbprev",                   command = '<cmd>sbprev<cr>',        keys = {"<S-F8>"},    modes = "nx" },
  { comment = "lwindow",                  command = '<cmd>lwindow<cr>',       keys = {"<F5>"},      modes = "nx" },
  { comment = "start of line",            command = '<Home>',                 keys = {"<C-A>"},     modes = "c"  },
  { comment = "end of line",              command = '<End>',                  keys = {"<C-E>"},     modes = "c"  },
  { comment = "delete char under cursor", command = '<C-D>',                  keys = {"<Del>"},     modes = "c"  },
  { comment = "back 1 char",              command = '<C-B>',                  keys = {"<Left>"},    modes = "c"  },
  { comment = "forward 1 char",           command = '<C-F>',                  keys = {"<Right>"},   modes = "c"  },
  { comment = "previous command",         command = '<C-P>',                  keys = {"<Up>"},      modes = "c"  },
  { comment = "next command",             command = '<C-N>',                  keys = {"<Down>"},    modes = "c"  },
  { comment = "toggle file tree",         command = '<cmd>LuaTreeToggle<cr>', keys = {"<leader>e"}, modes = "nx" },
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
