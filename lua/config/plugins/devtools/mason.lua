-- Mason plugin is used to install
-- the different Lsp servers and
-- formatters.
return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
    },

    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",

        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = require("custom.tools").all(),
                auto_update = false,
                run_on_start = false,
            })
        end,
    },
}
