--plugins for specific languages.
return {
    -- rust
    {
        "mrcjkb/rustaceanvim",
        ft = { "rust" },
        version = "^7",
        -- lazy = false, -- This plugin is already lazy
    },
    --go
    {
        "ray-x/go.nvim",
        ft = { "go", "gomod", "gosum", "gotexttmpl", "gohtmltmpl" },
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        build = ':lua require("go.install").update_all_sync()',
    },
}
