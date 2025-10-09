-- Autotag plugin helps to add the
-- corresponding tag for markup 
-- languages like html

return {
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        config = function()
            require("nvim-ts-autotag").setup({
                filetypes = {
                    "html", "xml", "javascript", "typescript",
                    "javascriptreact", "typescriptreact", "svelte", "vue",
                    "tsx", "jsx", "rescript", "php", "markdown",
                    "astro", "glimmer", "handlebars", "hbs",
                },
            })
        end,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
