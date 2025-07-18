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
    end
    },
}