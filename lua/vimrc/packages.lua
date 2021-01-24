local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = vim.g.vimrc_pack_dir..'/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

local packer = require('packer')

-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

-- Initialize Packer.
packer.init({
    package_root = vim.g.vimrc_pack_dir,
    plugin_package = "packer",
})

return packer.startup(function()
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
  use {'Iron-E/nvim-libmodal', as = 'libmodal.nvim' } 
  use {'neovim/nvim-lsp', as = 'nvim_lsp.nvim' } 
  use {'nvim-lua/completion-nvim', as = 'completion.nvim'}
  use {'rafcamlet/nvim-luapad', cmd = 'LuaPad'}
  use {'tpope/vim-dispatch', cmd = {'Dispatch', 'Make', 'Focus', 'Start'}, as = "dispatch.vim" }
  use "AndrewRadev/sideways.vim"
  use "AndrewRadev/splitjoin.vim"
  use "Iron-E/nvim-libmodal"
  --use "RRethy/vim-illuminate"
  use "Shougo/dein.vim"
  use "Shougo/echodoc.vim"
  use "blackCauldron7/surround.nvim"
  use "bluz71/vim-nightfly-guicolors"
  use "chrisbra/unicode.vim"
  use "fatih/vim-go"
  use "hkupty/daedalus.nvim"
  use "hkupty/impromptu.nvim"
  use "hkupty/iron.nvim"
  use "jacoborus/tender.vim"
  use "jamessan/vim-gnupg"
  use "junegunn/goyo.vim"
  use "junegunn/limelight.vim"
  use "junegunn/vim-easy-align"
  use "justinmk/vim-sneak"
  -- use "kana/vim-textobj-function"
  use "kana/vim-textobj-user"
  use "kyazdani42/nvim-tree.lua"
  use "kyazdani42/nvim-web-devicons"
  use "lambdalisue/gina.vim"
  use "lambdalisue/suda.vim"
  use "liuchengxu/vim-which-key"
  use "liuchengxu/vista.vim"
  use "lunarmodules/Penlight"
  use "mattn/vim-textobj-url"
  use "norcalli/nvim-colorizer.lua"
  use "norcalli/nvim-terminal.lua"
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/telescope.nvim"
  use "nvim-treesitter/nvim-treesitter"
  use "reedes/vim-wordy"
  use "romainl/vim-qf"
  use "rust-lang/rust.vim"
  use "sheerun/vim-polyglot"
  use "svermeulen/vimpeccable"
  use "tjdevries/colorbuddy.nvim"
  use "tjdevries/express_line.nvim"
  use "tjdevries/vlog.nvim"
  use "tpope/vim-abolish"
  use "tpope/vim-endwise"
  use "tpope/vim-jdaddy"
  use "tpope/vim-markdown"
  use "tpope/vim-repeat"
  use "tpope/vim-scriptease"
  use "tpope/vim-surround"
  use "tpope/vim-unimpaired"
  use "tweekmonster/helpful.vim"
  use "tyru/caw.vim"
  use "wbthomason/packer.nvim"
  -- use "akinsho/nvim-bufferline.lua"
  use "wellle/targets.vim"
end)
