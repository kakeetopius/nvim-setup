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
			--import lspconfig plugin
			--local lspconfig = require("lspconfig")
			local lspconfig = vim.lsp.config

			--import cmp-nvim-lsp plugin
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local keymap = vim.keymap

			local opts = { noremap = true, silent = true }

			vim.lsp.on_attach = function(client, bufnr)
				opts.buffer = bufnr

				if client.server_capabilities.documentSymbolProvider then
					require("nvim-navic").attach(client, bufnr)
				end

				-- LSP Keymaps Extras (Most provided by snacks)
				opts.desc = "Show available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>n", vim.lsp.buf.rename, opts)

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)

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

			local util = require("lspconfig.util")
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
			    "bashls"
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

			lspconfig("clangd" , {
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
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
							shadow = true,
						},
						staticcheck = true,
					},
				},
			})

			lspconfig("intelephense", {
				capabilities = capabilities,
				root_dir = util.root_pattern("composer.json", ".git"),
			})

			lspconfig("html", {
				capabilities = capabilities,
				init_options = {
					configurationSection = { "html", "javascript", "typescript", "css" },
					embeddedLanguages = {
						javascript = true,
						css = true,
					},
				},
				filetypes = { "html" },
			})

			lspconfig("cssls", {
				capabilities = capabilities,
				root_dir = util.root_pattern("package.json", ".git"),
			})

			lspconfig("ts_ls", {
				capabilities = capabilities,
				cmd = { "typescript-language-server", "--stdio" },
				root_dir = util.root_pattern("package.json", "tsconfig.json", ".git"),
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			})

			lspconfig("bashls", {
				capabilities = capabilities,
				filetypes = { "sh", "bash" },
				cmd = { "bash-language-server", "start" },
			})

			lspconfig("dockerls", {
				capabilities = capabilities,
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
