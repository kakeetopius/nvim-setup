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
    { "rust_analyzer", enable = false }, -- will be enabled by rustaceanvim plugin
    { "kotlin_language_server" },
    { "docker_compose_language_service" },
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

-- names of all dev tools. To be used for installation purposes via MasonToolInstall
local function get_all_tools()
    local all_tools = {}
    for _, lsp in ipairs(lsps) do
        table.insert(all_tools, lsp[1])
    end

    vim.list_extend(all_tools, M.daps)
    vim.list_extend(all_tools, M.formatters)
    return all_tools
end

-- names of enabled_lsps only
local function get_enabled_lsps()
    local enabled_lsps = {}
    for _, lsp in ipairs(lsps) do
        if lsp.enable ~= nil and not lsp.enable then goto continue end
        table.insert(enabled_lsps, lsp[1])
        ::continue::
    end
    return enabled_lsps
end

M.enabled_lsps = get_enabled_lsps
M.all = get_all_tools

return M
