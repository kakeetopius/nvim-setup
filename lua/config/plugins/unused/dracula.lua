return {
     {
        "Mofiqul/dracula.nvim",
        priority = 1000,
        config = function()
            require("dracula").setup({
                transparent_bg = true,
                italic_comment = true,
                overrides = {
                    ["@type"] = { fg = "#bd93f9" },
                    ["@function"] = { fg = "#50fa7b" },
                    ["@keyword"] = { fg = "#ff79c6", bold = true },
                    ["@variable"] = { fg = "#7fa0ff" },
                    ["@variable.builtin"] = { fg = "#8be9fd", italic = true },
                    ["@property"] = { fg = "#f1fa8c" },
                    ["@field"] = { fg = "#f1fa8c" },
                    ["@number"] = { fg = "#BD93F9" },
                    ["@string"] = { fg = "#db9f60", italic = true },
                    ["@keyword.return"] = { fg = "#ff79c6", bold = true },
                    ["@comment"] = { fg = "#aab4be", italic = true },
                    ["@punctuation.bracket"] = { fg = "#e3e846", bold = true },
                    ["@punctuation.special"] = { fg = "#8a88c4" },
                },
            })

            vim.cmd.colorscheme("dracula")
        end,
    },
}