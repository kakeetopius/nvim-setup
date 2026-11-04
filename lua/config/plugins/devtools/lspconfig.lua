-- nvim-lspconfig plugin is used to configure the
-- different lsp servers.
return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },

        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- for autocompletion from lsp
            { "antosha417/nvim-lsp-file-operations", config = true },
        },

        config = function()
            local lspconfig = vim.lsp.config

            vim.lsp.on_attach = function(client, bufnr)
                if client.server_capabilities.documentSymbolProvider then
                    --attach nvim-navic which gets breadcrumbs of different symbols
                    require("nvim-navic").attach(client, bufnr)
                end
            end

            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local capabilities = cmp_nvim_lsp.default_capabilities()

            local lsps = require("custom.tools").enabled_lsps()
            vim.lsp.enable(lsps)
            --LSP Servers
            lspconfig("*", {
                capabilities = capabilities,
            })

            lspconfig("ty", {
                settings = {
                    ty = {},
                },
            })

            lspconfig("ruby_lsp", {
                root_markers = { "Gemfile", ".git", "Vagrantfile" },
            })

            lspconfig("html", {
                filetypes = { "html", "htmltmpl" },
            })

            lspconfig("powershell_es", {
                bundle_path = "~/.local/share/nvim/mason/packages/powershell-editor-services",
            })

            lspconfig("clangd", {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=never",
                    "--completion-style=detailed",
                    "--cross-file-rename",
                    "--all-scopes-completion",
                    "--pch-storage=memory",
                    "--function-arg-placeholders",
                    "--query-driver=/usr/bin/gcc,/usr/bin/g++",
                },
                init_options = {
                    clangdFileStatus = true,
                    usePlaceholders = true,
                    completeUnimported = true,
                },
            })

            lspconfig("gopls", {
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                            shadow = true,
                        },
                        staticcheck = true,
                        completeUnimported = true,
                        usePlaceholders = true,
                    },
                },
            })

            lspconfig("bashls", {
                filetypes = { "sh", "bash" },
                cmd = { "bash-language-server", "start" },
            })

            lspconfig("yamlls", {
                settings = {
                    yaml = {
                        hover = true,
                        completion = true,
                        format = {
                            enable = true,
                        },
                    },
                },
            })
        end,
    },
}
