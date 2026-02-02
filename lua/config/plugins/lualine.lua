--lualine.nvim — a fast and highly customizable statusline plugin that shows useful information like the current mode,
--file name, git branch, diagnostics, and more
return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "SmiteshP/nvim-navic",
        },
        config = function()
            require("nvim-navic").setup({
                highlight = true,
                separator = " › ",
                depth_limit = 5,
            })

            require("lualine").setup({
                options = {
                    theme = "auto", -- or any theme you prefer
                    icons_enabled = true,
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diagnostics", "diff" },
                    lualine_c = {
                        {
                            function()
                                local reg = vim.fn.reg_recording()
                                if reg ~= "" then
                                    return "recording @" .. reg
                                end
                                return ""
                            end,
                        },
                    },
                    --lualine_x = { 'encoding','fileformat','filetype' },
                    lualine_x = { "filetype" },
                    lualine_y = { "progress" }, -- Shows scroll percentage like 33%
                    lualine_z = { "location" },
                },
            })
        end,
    },
}
