local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure paq is installed.
local install_dir = vim.fn.stdpath('data') ..'/site/pack/paqs/opt/paq-nvim'
local install_url = 'https://github.com/savq/paq-nvim.git'
if fn.empty(fn.glob(install_dir)) > 0 then
  execute(table.concat({'!git', 'clone', install_url, install_dir}, ' '))
end

-- load and bind paq globally.
vim.cmd 'packadd paq-nvim'
_G['paq'] = require('paq-nvim').paq
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself


_G["bindmap"] = function(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Globally Exposed Libraries
_G["global_library"] = function(name, real)
  if _G[name] == nil then
    if real == nil then real = name end
    _G[name] = require(real)
  end
end



paq {'rafcamlet/nvim-luapad', cmd = 'LuaPad'}
paq {'tpope/vim-dispatch', cmd = {'Dispatch', 'Make', 'Focus', 'Start'}, as = "dispatch.vim" }
paq "AndrewRadev/sideways.vim"
paq "AndrewRadev/splitjoin.vim"
--paq "RRethy/vim-illuminate"
paq "Shougo/dein.vim"
paq "Shougo/echodoc.vim"
paq "blackCauldron7/surround.nvim"
paq "chrisbra/unicode.vim"
paq "fatih/vim-go"
paq "hkupty/daedalus.nvim"
paq "hkupty/impromptu.nvim"
paq "hkupty/iron.nvim"
paq "jacoborus/tender.vim"
paq "jamessan/vim-gnupg"
paq "junegunn/goyo.vim"
paq "junegunn/limelight.vim"
paq "junegunn/vim-easy-align"
paq "justinmk/vim-sneak"
-- paq "kana/vim-textobj-function"
paq "kana/vim-textobj-user"
paq "kyazdani42/nvim-tree.lua"
paq "lambdalisue/gina.vim"
paq "lambdalisue/suda.vim"
paq "liuchengxu/vim-which-key"
paq "liuchengxu/vista.vim"
paq "lunarmodules/Penlight"
paq "mattn/vim-textobj-url"
paq "norcalli/nvim-terminal.lua"
paq "nvim-lua/plenary.nvim"
paq "nvim-lua/popup.nvim"
paq "reedes/vim-wordy"
paq "romainl/vim-qf"
paq "rust-lang/rust.vim"
paq "sheerun/vim-polyglot"
paq "svermeulen/vimpeccable"
paq "tjdevries/vlog.nvim"
paq "tpope/vim-abolish"
paq "tpope/vim-endwise"
paq "tpope/vim-jdaddy"
paq "tpope/vim-markdown"
paq "tpope/vim-repeat"
paq "tpope/vim-scriptease"
paq "tpope/vim-surround"
paq "tpope/vim-unimpaired"
paq "tweekmonster/helpful.vim"
paq "tyru/caw.vim"
-- paq "akinsho/nvim-bufferline.lua"
paq "wellle/targets.vim"


global_library('devicons', 'nvim-web-devicons')
global_library('impromptu')
-- global_library('libmodal')
global_library('lspconfig')
global_library('packer')
global_library('pl')
global_library('el')
global_library('plenary')
global_library('popup')
global_library('surround')
global_library('terminal')
global_library('daedalus')
global_library('vimp')
global_library('vlog')

-- Initialize/Setup Global Libraries.
--
_G["daedalus"].helpers = require("daedalus.helpers")
_G["daedalus"].specs = require("daedalus.specs")
_G["devicons"].setup({})
_G["plenary"].Job = require('plenary.job')
_G["plenary"].context_manager = require('plenary.context_manager')
_G["plenary"].filetype = require('plenary.filetype')
_G["pl"] = {}
_G["pl"].List = require('pl.List')
_G["pl"].lexer = require('pl.lexer')
_G["pl"].pretty = require('pl.pretty')
_G["pl"].seq = require('pl.seq')
_G["pl"].template = require('pl.template')
_G["pl"].stringx = require('pl.stringx')
_G["pl"].utils = require('pl.utils')
_G["plenary"].popup = require('plenary.popup')
_G["plenary"].scandir = require('plenary.scandir')
_G["plenary"].strings = require('plenary.strings')
_G["plenary"].window = require('plenary.window')
_G["serpent"] = require('vimrc/vendored/serpent')
_G["surround"].setup({})
_G["terminal"].setup({})

vimrc.log = require('vlog').new { plugin = 'vimrc' }
