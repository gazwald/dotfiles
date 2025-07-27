require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
})

require("options/treesitter")
require("options/telescope")
require("options/lsp")
require("options/cmp")
require("options/colorizer")
require("options/formatter")
require("options/fzf")
require("options/lualine")

require("gitsigns").setup()
require("trouble").setup()

require("bufferline").setup({})

-- require("options/golang")
-- require("render-markdown").setup()
-- require("options/avante")
