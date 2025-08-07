-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		python = {
			require("formatter.filetypes.python").isort,
			require("formatter.filetypes.python").ruff,
		},
		terraform = {
			require("formatter.filetypes.terraform").terraformfmt,
		},
		json = {
			require("formatter.filetypes.json").jq,
		},
		yaml = {
			require("formatter.filetypes.yaml").yamllint,
		},
		go = {
			require("formatter.filetypes.go").gofumpt,
		},
		markdown = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						"--print-width",
						"120",
						"--prose-wrap",
						"always",
						util.escape_path(util.get_current_buffer_file_path()),
						"--parser",
						"markdown",
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
