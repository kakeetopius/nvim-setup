-- nvim-treesitter — provides better syntax highlighting and code understanding by using Tree-sitter parsers.
-- making highlighting, indentation, and code navigation more accurate and language-aware.

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    branch = "master",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "comment",
                "css",
                "diff",
                "dockerfile",
                "git_config",
                "gitcommit",
                "gitignore",
                "go",
                "gomod",
                "gosum",
                "gotmpl",
                "html",
                "http",
                "java",
                "javascript",
                "jsdoc",
                "json",
                "json5",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "python",
                "regex",
                "rst",
                "rust",
                "ssh_config",
                "sql",
                "terraform",
                "toml",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            auto_install = true,

            highlight = {
                enable = true,
            },
        })
    end,
}
