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
            local lsps = require("custom.tools").enabled_lsps()
            local lspconfig = vim.lsp.config

            --import cmp-nvim-lsp plugin
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            vim.lsp.on_attach = function(client, bufnr)
                if client.server_capabilities.documentSymbolProvider then
                    require("nvim-navic").attach(client, bufnr)
                end
            end

            local capabilities = cmp_nvim_lsp.default_capabilities()

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

            lspconfig("html", {
                filetypes = { "html", "gohtmltmpl" },
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
                        schemas = {
                            ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
                                "docker-compose.yml",
                                "docker-compose.*.yml",
                            },
                        },
                        validate = true,
                        hover = true,
                        completion = true,
                        format = {
                            enable = true,
                        },
                    },
                },
            })

            lspconfig("lua_ls", {
                settings = { --custom settings for lua
                    Lua = {
                        --make the language server recognize "vim" global
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            --make language server aware of runtime files
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                    },
                },
            })
        end,
    },
}
