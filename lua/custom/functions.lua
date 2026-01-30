-- Show diagnostics on cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "rounded",
            source = "always",
            prefix = "",
            scope = "cursor",
        })
    end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*",
    callback = function()
        vim.cmd("normal! zR")
    end,
})

vim.api.nvim_create_autocmd("WinEnter", {
    callback = function()
        local cfg = vim.api.nvim_win_get_config(0)
        if cfg.relative ~= "" then
            vim.wo.foldenable = false
        end
    end,
})

-- Make nvim recognise some files as shell
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { ".bashrc", ".bash_profile", ".zshrc", ".zprofile", ".profile" },
    callback = function()
        vim.bo.filetype = "sh"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
        vim.bo.expandtab = false -- use tabs, not spaces (Go standard)
        vim.bo.shiftwidth = 4 -- indent operations = 4 spaces
        vim.bo.tabstop = 4 -- a tab character looks like 4 spaces
        vim.bo.softtabstop = 4 -- <Tab> feels like 4 spaces when editing
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "telekasten",
    callback = function()
        vim.bo.filetype = "markdown"
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local conform = require("conform")
        -- Shared formatting options
        local format_opts = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
        }
        conform.format(format_opts)
    end,
})

-- Enable inlay hints when LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
        vim.lsp.inlay_hint.enable()
    end,
})

vim.diagnostic.config({
    virtual_text = true,
})

vim.filetype.add({
    extension = {
        tmpl = "gotmpl",
    },
})
