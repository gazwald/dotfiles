-- vim: ts=2 sts=2 sw=2 et

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin', '$HOME/.config/nvim/plugged')

-- Plug('preservim/nerdtree')
-- Plug('tiagofumo/vim-nerdtree-syntax-highlight')

Plug('tpope/vim-fugitive')
Plug('lewis6991/gitsigns.nvim')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.5' })
Plug('nvim-telescope/telescope-fzy-native.nvim')

Plug('dense-analysis/ale')

Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('neovim/nvim-lspconfig')
Plug('ray-x/go.nvim')

Plug('nvim-tree/nvim-web-devicons')
Plug('akinsho/bufferline.nvim', { ['tag'] = '*' })

Plug('norcalli/nvim-colorizer.lua')

Plug('nvim-lualine/lualine.nvim')

Plug('catppuccin/nvim', { ['as'] = 'catppuccin' })

Plug('folke/trouble.nvim')

vim.call('plug#end')

require('settings')
require('plugins')
require('bindings')