-- nvim-treesitter — provides better syntax highlighting and code understanding by using Tree-sitter parsers.
-- making highlighting, indentation, and code navigation more accurate and language-aware.

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    branch = "main",
    config = function()
        local ts = require("nvim-treesitter")
        local parsers = {
            "bash",
            "comment",
            "css",
            "diff",
            "dockerfile",
            "git_config",
            "gitcommit",
            "gitignore",
            "go",
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
        }

        for _, parser in ipairs(parsers) do
            ts.install(parser)
        end

        -- Not every tree-sitter parser is the same as the file type detected
        -- So the patterns need to be registered more cleverly
        local patterns = {}
        for _, parser in ipairs(parsers) do
            local parser_patterns = vim.treesitter.language.get_filetypes(parser)
            for _, pp in pairs(parser_patterns) do
                table.insert(patterns, pp)
            end
        end

        vim.api.nvim_create_autocmd("FileType", {
            pattern = patterns,
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
