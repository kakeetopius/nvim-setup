local M = {}

---@class lsp
---@field name string
---@field enabled boolean
local lsp = {}
lsp.__index = lsp

---@param name string
---@param enabled boolean?
function lsp.new(name, enabled)
    local l = setmetatable({}, lsp)
    l.name = name
    if enabled == nil then enabled = true end
    l.enabled = enabled
    return l
end

local lsps = {
    lsp.new("ty"),
    lsp.new("clangd"),
    lsp.new("lua_ls"),
    lsp.new("intelephense"),
    lsp.new("gopls"),
    lsp.new("yamlls"),
    lsp.new("html"),
    lsp.new("cssls"),
    lsp.new("dockerls"),
    lsp.new("bashls"),
    lsp.new("powershell_es"),
    lsp.new("rust_analyzer", false), -- will be enabled by rustaceanvim
    lsp.new("docker_compose_language_service"),
    lsp.new("buf_ls"),
    lsp.new("svelte"),
    lsp.new("ruby_lsp"),
}

function lsps:names()
    local lsp_names = {}
    for _, l in ipairs(self) do
        table.insert(lsp_names, l.name)
    end
    return lsp_names
end

function lsps:enabled()
    local lsp_names = {}
    for _, l in ipairs(self) do
        if not l.enabled then goto continue end
        table.insert(lsp_names, l.name)
        ::continue::
    end
    return lsp_names
end

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
    "rubocop",
}

-- names of all dev tools. To be used for installation purposes via MasonToolInstall
local function get_all_tools()
    local all_tools = {}
    vim.list_extend(all_tools, lsps:names())
    vim.list_extend(all_tools, M.daps)
    vim.list_extend(all_tools, M.formatters)
    return all_tools
end

M.enabled_lsps = function() return lsps:enabled() end
M.all_lsps = function() return lsps:names() end
M.all = get_all_tools

return M
