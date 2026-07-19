-- tokyonight - the colorscheme

return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function() vim.cmd.colorscheme("tokyonight-night") end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        -- config = function()
        --     vim.cmd.colorscheme("catppuccin")
        -- end,
    },

    {

        "navarasu/onedark.nvim",
        -- priority = 1000, -- make sure to load this before all the other start plugins
        -- config = function()
        --     require("onedark").setup({
        --         style = "darker",
        --     })
        --     require("onedark").load()
        -- end,
    },
}
