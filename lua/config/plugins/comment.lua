--Comment.nvim — allows to easily comment or uncomment lines of code using simple keybindings.
--It automatically detects the correct comment syntax for each language,

return {
    {
        "numToStr/Comment.nvim",
        opts = {}, -- uses default keymaps and behavior
        lazy = false,

        config = function()
            require("Comment").setup({
                toggler = {
                    line = "<leader>/", -- in normal mode
                },
                opleader = {
                    line = "<leader>/", -- in visual mode
                },
            })
        end,
    },

    -- For higlighting of TODO commonets and the like.
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
}
