-- Conform plugin used to configure the formatters
-- for different plugins.

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		-- Shared formatting options
		local format_opts = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
		}

		conform.setup({
			-- Formatter configuration by file type
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				python = { "black" },
				markdown = { "prettier" },
			},

			formatters = {
				-- sql_formatter = {
				--   command = "sql-formatter",
				--   args = { "--language", "mysql" }, -- or mysql/sql/sqlite depending on use
				--   stdin = false,
				-- },
			},

			-- Format-on-save configuration
		})

		-- Key mapping for formatting
		vim.keymap.set({ "n", "v" }, "<leader>fp", function()
			conform.format(format_opts)
		end, { desc = "Format file or range (in visual mode)" })
	end,
}

