-- Plugin barbar is used to manage and configure tabs and buffers.
return {
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {},
        version = "^1.0.0", -- optional: only update when a new 1.x version is released
    },
}
