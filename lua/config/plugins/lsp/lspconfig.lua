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

            --import cmp-nvim-lsp plugin
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            vim.lsp.on_attach = function(client, bufnr)
                if client.server_capabilities.documentSymbolProvider then
                    require("nvim-navic").attach(client, bufnr)
                end

                --SERVER SPECIFIC CONFIGS
                --intelephense
                if client.name == "intelephense" then
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end
                -- ts_ls
                if client.name == "ts_ls" then
                    client.server_capabilities.documentFormattingProvider = false
                end
            end

            local capabilities = cmp_nvim_lsp.default_capabilities()

            local enabled_lsps = {
                "pyright",
                "clangd",
                "ts_ls",
                "lua_ls",
                "intelephense",
                "gopls",
                "yamlls",
                "html",
                "cssls",
                "dockerls",
                "mesonlsp",
                "bashls",
            }

            vim.lsp.enable(enabled_lsps)
            --LSP Servers
            lspconfig("pyright", {
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = { typeCheckingMode = "off" },
                    },
                },
            })

            lspconfig("clangd", {
                capabilities = capabilities,
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
                    },
                },
		capabilities = capabilities
            })

            lspconfig("bashls", {
                capabilities = capabilities,
                filetypes = { "sh", "bash" },
                cmd = { "bash-language-server", "start" },
            })

            lspconfig("yamlls", {
                capabilities = capabilities,
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
                capabilities = capabilities,
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
