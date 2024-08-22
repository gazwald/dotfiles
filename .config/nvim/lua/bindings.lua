vim.keymap.set("n", "<A-h>", "<CMD>bp<CR>", { desc = "Go to previous buffer" })

vim.keymap.set("n", "<Tab>", ":bnext<cr>", { desc = "" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<cr>", { desc = "" })
vim.keymap.set("n", "<Leader>d", ":bdelete<cr>", { desc = "" })

vim.keymap.set("n", "<C-l>", ":nohl<CR><C-l>", { desc = "Clear search" })

vim.keymap.set("n", "<leader>ff", function() require('telescope.builtin').find_files() end)
vim.keymap.set("n", "<leader>fg", function() require('telescope.builtin').live_grep() end)
vim.keymap.set("n", "<leader>gs", function() require('telescope.builtin').git_status() end)
vim.keymap.set("n", "<leader>fr", function() require('telescope.builtin').lsp_references() end)
vim.keymap.set("n", "<leader>fb", function() require('telescope.builtin').buffers() end)
vim.keymap.set("n", "<leader>fh", function() require('telescope.builtin').help_tags() end)

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
