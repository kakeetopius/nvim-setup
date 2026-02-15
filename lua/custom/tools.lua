local M = {}
M.lsps = {
    "ty",
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
    "powershell_es",
    "rust_analyzer",
    "kotlin_language_server",
    "docker-compose-language-service",
    "yaml-language-server",
}

M.daps = {
    "debugpy",
    "delve",
    "codelldb",
}

M.formatters = {
    "ruff",
    "gofumpt",
    "prettier",
    "stylua",
}
local all = {}
vim.list_extend(all, M.lsps)
vim.list_extend(all, M.daps)
vim.list_extend(all, M.formatters)

M.all = all
return M
