-- Autopairs plugin is used to automatically add
-- corresponding matches e.g. parentheses
-- etc
return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
}
