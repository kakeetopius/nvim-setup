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
			local lspconfig = require("lspconfig")

			--import cmp-nvim-lsp plugin
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local keymap = vim.keymap

			local opts = { noremap = true, silent = true }

			local on_attach = function(client, bufnr)
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
			end

			local capabilities = cmp_nvim_lsp.default_capabilities()

			local util = require("lspconfig.util")

			--LSP Servers
			lspconfig.pyright.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					python = {
						analysis = { typeCheckingMode = "off" },
					},
				},
			})

			lspconfig.clangd.setup({
				on_attach = on_attach,
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

			lspconfig.intelephense.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
					on_attach(client, bufnr)
				end,
				root_dir = util.root_pattern("composer.json", ".git"),
			})

			lspconfig.html.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			init_options = {
				configurationSection = { "html", "javascript", "typescript", "css" },
				embeddedLanguages = {
					javascript = true,
					css = true,
				},
			},
			filetypes = { "html" },
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				root_dir = util.root_pattern("package.json", ".git"),
			})

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
					on_attach(client, bufnr)
				end,
				cmd = { "typescript-language-server", "--stdio" },
				root_dir = util.root_pattern("package.json", "tsconfig.json", ".git"),
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			})

			lspconfig.bashls.setup({
			    capabilities = capabilities,
			    filetypes = {"sh", "bash"},
			    cmd = {"bash-language-server", "start"},
			})


			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
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

