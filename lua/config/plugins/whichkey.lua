-- which-key.nvim — shows a helpful popup of available keybindings as users start typing a command.
-- It’s great for remembering shortcuts and exploring mappings without needing to check config files.

return {
    {
        "folke/which-key.nvim",

        event = "VeryLazy",

        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
}
