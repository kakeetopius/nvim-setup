return {
    {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = "TSUpdate",
	config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "lua", "python", "javascript", "html", "json", "c", "cpp",
                    "bash", "markdown", "markdown_inline", "java", "vim",
                    "query", "css", "typescript", "tsx", "yaml", "toml",
                    "rust", "go", "php",
                },

			sync_install = false,
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = false,

			indent = { enable = true },

			highlight = {
				enable = true,
				disable = { "c", "rust" },
				additional_vim_regex_highlighting = true,
			},
		})
		end,
	}
}
