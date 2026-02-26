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

-- Make nvim recognise some files as shell
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { ".bashrc", ".bash_profile", ".zshrc", ".zprofile", ".profile" },
    callback = function() vim.bo.filetype = "sh" end,
})

-- Recongise telekasten files as markdown files.
vim.api.nvim_create_autocmd("FileType", {
    pattern = "telekasten",
    callback = function() vim.bo.filetype = "markdown" end,
})

-- Auto format before saving file
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
    callback = function() vim.lsp.inlay_hint.enable() end,
})

-- Open Troubles Quickfix when the qf list opens
vim.api.nvim_create_autocmd("BufRead", {
    callback = function(ev)
        if vim.bo[ev.buf].buftype == "quickfix" then
            vim.schedule(function()
                vim.cmd([[cclose]])
                vim.cmd([[Trouble qflist open]])
            end)
        end
    end,
})

vim.diagnostic.config({
    virtual_text = true,
})
