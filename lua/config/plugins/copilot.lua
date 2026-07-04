return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        build = "make tiktoken",
        opts = {
            window = {
                layout = "float",
                width = 0.7,
            },
        },
    },

    {
        "zbirenbaum/copilot.lua",
        branch = "master",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = {
                enabled = true,
                auto_trigger = true,
                keymap = {
                    accept = "<M-a>",
                },
            },
        },
    },
}
