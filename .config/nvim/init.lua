-- vim: ts=2 sts=2 sw=2 et

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local gh = function(x)
	return "https://github.com/" .. x
end

vim.pack.add({
	{ src = gh("catppuccin/nvim"), name = "catppuccin" },
	{ src = gh("nvim-telescope/telescope.nvim"), version = "v0.2.1" },
	gh("lewis6991/gitsigns.nvim"),
	gh("tpope/vim-fugitive"),
	gh("nvim-tree/nvim-web-devicons"),
	gh("nvim-lua/plenary.nvim"),
	gh("nvim-telescope/telescope-fzy-native.nvim"),
	gh("neovim/nvim-lspconfig"),
	gh("hrsh7th/cmp-nvim-lsp"),
	gh("hrsh7th/cmp-buffer"),
	gh("hrsh7th/cmp-path"),
	gh("hrsh7th/cmp-cmdline"),
	gh("hrsh7th/nvim-cmp"),
	gh("hrsh7th/cmp-vsnip"),
	gh("hrsh7th/vim-vsnip"),
	gh("folke/trouble.nvim.git"),
	gh("mhartington/formatter.nvim"),
	gh("akinsho/bufferline.nvim"),
	gh("nvim-lualine/lualine.nvim"),
	gh("norcalli/nvim-colorizer.lua"),
})

vim.cmd.colorscheme("catppuccin")

require("settings")
require("plugins")
require("bindings")
