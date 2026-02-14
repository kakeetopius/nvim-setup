-- noice.lua used for ui elements but only used for cmdline in this configuration

return {
    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            cmdline = {
                enabled = true,
                view = "cmdline",
                opts = {},
                ---@type table<string, CmdlineFormat>
                format = {
                    -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
                    -- view: (default is cmdline view)
                    -- opts: any options passed to the view
                    -- icon_hl_group: optional hl_group for the icon
                    -- title: set to anything or empty string to hide
                    cmdline = { pattern = "^:", icon = "", lang = "vim" },
                    search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                    filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                    lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
                    help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
                    input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
                    -- lua = false, -- to disable a format, set to `false`
                },
            },

            messages = {
                enabled = true,
                view = "mini",
            },
            views = {
                mini = {
                    timeout = 5000,
                },
            },
            popupmenu = { enabled = true },
            notify = { enabled = false, view = "notify" },
            --
            lsp = {
                progress = { enabled = false },
                hover = { enabled = false },
                signature = { enabled = false },
                message = { enabled = false },
            },
            health = { checker = true },
            markdown = { hover = {}, highlights = {} },
            presets = {
                command_palette = true,
                bottom_search = true,
            },
        },

        dependencies = {
            "MunifTanjim/nui.nvim",
        },
    },
}
