vim.cmd [[packadd packer.nvim]] -- lazily load packer.
local packer = require'packer'
local use = packer.use

-- Initialize Packer.
packer.init({
    package_root = vim.g.vimrc_pack_dir,
    plugin_package = "packer",
})

---------------------------------------------------------------------------
-- Simple plugins can be specified as strings
-- use '9mm/vim-closer'
--
-- Lazy loading:
-- Load on specific commands
-- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
--
-- Load on an autocommand event
-- use {'andymass/vim-matchup', event = 'VimEnter *'}
--
-- Load on a combination of conditions: specific filetypes or commands
-- Also run code after load (see the "config" key)
-- use {
--   'w0rp/ale',
--   ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
--   cmd = 'ALEEnable',
--   config = 'vim.cmd[[ALEEnable]]'
-- }
--
-- Plugins can have dependencies on other plugins
-- use {
--   'haorenW1025/completion-nvim',
--   opt = true,
--   requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
-- }
--
-- Local plugins can be included
-- use '~/projects/personal/hover.nvim'
--
-- Plugins can have post-install/update hooks
-- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
--
-- You can specify multiple plugins in a single call
-- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}
--
-- You can alias plugin names
-- use {'dracula/vim', as = 'dracula'}
---------------------------------------------------------------------------
use {'wbthomason/packer.nvim', opt = false} 
use 'nvim-lua/telescope.nvim'
use 'nvim-lua/plenary.nvim'
use {'rafcamlet/nvim-luapad', cmd = 'LuaPad'}
use "svermeulen/vimpeccable"
use {"tjdevries/express_line.nvim", as = "statusline.nvim"}
use 'nvim-lua/popup.nvim'
use {'askinsho/nvim-bufferline.lua', as = 'bufferline.nvim'}
use {'nvim-lua/diagnostic-nvim', as = 'diagnostic.nvim'} 
use {'nvim-lua/completion-nvim', as = 'completion.nvim'}
use {'Iron-E/nvim-libmodal', as = 'libmodal.nvim' } 
use {'neovim/nvim-lsp', as = 'nvim_lsp.nvim' } 


-- DEIN (Legacy)
-- vim.cmd [[
-- " Dein Plugins Setup {{{1
--
-- " include dein in the runtime path.
-- let g:dein_rtp = g:vim_plugin_repos_dir . '/github.com/Shougo/dein.vim'
-- execute printf("set rtp+=%s", g:dein_rtp)
--
-- if !isdirectory(expand(g:dein_rtp).'/.git')
--   " clone dein if it is not a git repo already.
--   call mkdir(expand(g:dein_rtp), "p")
--   call system(printf("rm -rf %s", g:dein_rtp))
--   call system(printf("git clone https://github.com/Shougo/dein.vim %s", g:dein_rtp))
-- endif
--
-- " after loading dein, configure it.
-- let g:dein#install_progress_type = "tabline"
-- let g:dein#enable_name_conversion = 1
-- let g:dein#enable_notification = 1
-- let g:dein#install_process_timeout = 30
-- let g:dein#auto_recache = 1
-- let g:dein#install_log_filename = g:vim_config_dir . '/local/dein.log'
-- let g:dein#cache_directory = g:vim_plugins_dir
-- " ensure the cache directory exists.
-- if !isdirectory(expand(g:dein#cache_directory)) "{{{
--   call mkdir(expand(g:dein#cache_directory), "p")
-- endif "}}}
-- if dein#load_state(g:vim_plugins_dir) "{{{
--   call dein#begin(g:vim_plugins_dir)
--   call dein#add(g:dein_rtp)
--
--   " enables neovim support in vim8
--   if !has('nvim')
--     call dein#add('roxma/nvim-yarp')
--     call dein#add('roxma/vim-hug-neovim-rpc')
--   endif
--
--   call dein#add('Shougo/neosnippet.vim')
--   call dein#add('Shougo/neosnippet-snippets')
--
--   call dein#load_dict(json_decode(readfile(g:vim_config_dir . "/repos.json")))
--   call dein#end()
--   call dein#save_state()
-- endif "1}}}
-- ]]
