require("options/treesitter")
require("options/telescope")
require("options/lsp")
require("options/cmp")
require("options/colorizer")
require("options/formatter")
require("options/fzf")
require("options/golang")
require("options/lualine")

require("gitsigns").setup()
require("trouble").setup()
-- require("render-markdown").setup()

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	integrations = {
		gitgutter = true,
	},
})

require("bufferline").setup({})

vim.cmd("colorscheme catppuccin-mocha")
