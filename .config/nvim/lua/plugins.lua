require('options/treesitter')
require('options/lsp')
require('options/cmp')
require('options/colorizer')
require('options/ale')
require('options/fzf')
require('options/golang')

require('gitsigns').setup()
require('lualine').setup { extensions = {'fzf', 'fugitive'} }
require("bufferline").setup{}
