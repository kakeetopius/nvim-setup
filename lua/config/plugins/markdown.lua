-- This file contains plugins for editing and rendering of markdown files.

return {
    {
        "renerocksai/telekasten.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-telekasten/calendar-vim" },

        config = function()
            require("telekasten").setup({
                home = vim.fn.expand("~/Notes"),
            })
        end,
    },
    {

        "MeanderingProgrammer/render-markdown.nvim",
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
}
