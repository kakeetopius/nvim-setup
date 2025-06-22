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

    --THE FOLLOWING IS COMMENTED OUT TO PREVENT DOUBLE ATTACHEMENT OF LSPS

    -- config = function()
    --     local mason = require("mason")

    --     --import mason-lspconfig
    --     local mason_lspconfig = require("mason-lspconfig")
        
    --     local mason_tool_installer = require("mason-tool-installer")
        
    --     mason.setup()

    --     mason_lspconfig.setup({
    --         --list of servers for mason to install
    --         ensure_installed = {
    --             "html",
    --             "cssls",
    --             "pyright",
    --             "intelephense",
    --             "clangd",
    --             "lua_ls",
	-- 	        "ts_ls",
    --             "sqls",
    --             "jsonls ",
    --         },

    --         --auto install configured servers (with lspconfig)
    --         automatic_installation = true,

    --         handlers = nil,
    --     })

    --     mason_tool_installer.setup({
    --         ensure_installed = {
    --             "prettier",
    --             "stylua",
    --             "isort",
    --             "black",
    --             "sql-formatter",
    --         }
    --     })
    -- end
}
