return {
   {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            "SmiteshP/nvim-navic",
        },
        config = function()
            local navic = require("nvim-navic")

            require("nvim-navic").setup({
                highlight = true,
                separator = " › ",
                depth_limit = 5,
            })

            require('lualine').setup({
            options = {
                theme = "auto", -- or any theme you prefer
                icons_enabled = true,
            },
            sections = {
                lualine_b = {'branch', 'diagnostics', 'diff'},
                --lualine_x = { 'encoding','fileformat','filetype' },
                lualine_x = {'filetype'},
                lualine_y = { 'progress' },  -- Shows scroll percentage like 33%
                lualine_z = { 'location' },
                lualine_c = {
                    { 'filename' },
                    {
                        function()
                            return navic.get_location()
                        end,
                        cond = navic.is_available,
                    },
                },
            },
            })
        end,
   },

    -- For function signatures
    {
        "ray-x/lsp_signature.nvim",
        event = "LspAttach",
        opts = {
            bind = true,
            hint_enable = true,
            floating_window = true,
            handler_opts = {
                border = "rounded",
            },
            toggle_key = 'M-x',
        },
    },
}
