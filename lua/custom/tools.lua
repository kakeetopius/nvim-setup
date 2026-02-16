local M = {}

local lsps = {
    { "ty" },
    { "clangd" },
    { "ts_ls" },
    { "lua_ls" },
    { "intelephense" },
    { "gopls" },
    { "yamlls" },
    { "html" },
    { "cssls" },
    { "dockerls" },
    { "mesonlsp" },
    { "bashls" },
    { "powershell_es" },
    { "rust_analyzer", auto_enable = false }, -- will be enabled by rustaceanvim plugin
    { "kotlin_language_server" },
    { "docker-compose-language-service" },
    { "yaml-language-server" },
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

M.auto_enabled_lsps = {} -- lsps that will be enabled via vim.lsp.enable
local all_tools = {} -- names of all dev tools. To be used for installation purposes via MasonToolInstall

for _, lsp in ipairs(lsps) do
    table.insert(all_tools, lsp[1])
    if lsp.auto_enable ~= nil and not lsp.auto_enable then
        goto continue
    end
    table.insert(M.auto_enabled_lsps, lsp[1])
    ::continue::
end

vim.list_extend(all_tools, M.daps)
vim.list_extend(all_tools, M.formatters)

M.all = all_tools
return M
