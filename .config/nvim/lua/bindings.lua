vim.keymap.set("n", "<A-h>", "<CMD>bp<CR>", { desc = "Go to previous buffer" })

vim.keymap.set("n", "<Tab>", ":bnext<cr>", { desc = "" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<cr>", { desc = "" })
vim.keymap.set("n", "<Leader>d", ":bdelete<cr>", { desc = "" })

vim.keymap.set("n", "<Leader>gb", ":Git blame<cr>", { desc = "" })

vim.keymap.set("n", "<C-l>", ":nohl<CR><C-l>", { desc = "Clear search" })

vim.keymap.set("n", "<leader>ff", function() require('telescope.builtin').find_files() end)
vim.keymap.set("n", "<leader>fg", function() require('telescope.builtin').live_grep() end)
vim.keymap.set("n", "<leader>gs", function() require('telescope.builtin').git_status() end)
vim.keymap.set("n", "<leader>fr", function() require('telescope.builtin').lsp_references() end)
vim.keymap.set("n", "<leader>fb", function() require('telescope.builtin').buffers() end)
vim.keymap.set("n", "<leader>fh", function() require('telescope.builtin').help_tags() end)

vim.keymap.set("n", "<leader>sd", function() require("trouble").toggle("diagnostics") end)
vim.keymap.set("n", "<leader>ss", function() require("trouble").toggle("symbols") end)
