package.loaded['vimrc.packages'] = nil -- always reload this file on require()
vim.cmd [[packadd packer.nvim]] -- lazily load packer.
_G['packer'] = require('packer')
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
use {'wbthomason/packer.nvim', opt = true} 
use 'nvim-lua/telescope.nvim'
use 'nvim-lua/plenary.nvim'
use {'rafcamlet/nvim-luapad', cmd = 'LuaPad'}
use {'rafcamlet/nvim-luapad', cmd = 'LuaPad'}
use "svermeulen/vimpeccable"
use {"tjdevries/express_line.nvim", as = "statusline.nvim"}
use 'nvim-lua/popup.nvim'
use {'askinsho/nvim-bufferline.lua', as = 'bufferline.nvim'}
use {'nvim-lua/diagnostic-nvim', as = 'diagnostic.nvim'} 
use {'nvim-lua/completion-nvim', as = 'completion.nvim'}
use {'Iron-E/nvim-libmodal', as = 'libmodal.nvim' } 
use {'neovim/nvim-lsp', as = 'nvim_lsp.nvim' } 
