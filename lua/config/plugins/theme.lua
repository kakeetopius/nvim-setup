-- tokyonight - the colorscheme

return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd.colorscheme("tokyonight-night")
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        -- config = function()
        --     vim.cmd.colorscheme("kanagawa")
        -- end,
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        -- config = function()
        --     vim.cmd.colorscheme("catppuccin")
        -- end,
    },

    {

        "navarasu/onedark.nvim",
        -- priority = 1000, -- make sure to load this before all the other start plugins
        -- config = function()
        --     require("onedark").setup({
        --         style = "deep",
        --     })
        --     require("onedark").load()
        -- end,
    },
}
