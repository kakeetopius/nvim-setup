local augroup = vim.api.nvim_create_augroup("CustomAutocmds", { clear = true })

-- Show diagnostics on cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
    group = augroup,
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
    group = augroup,
    pattern = { ".bashrc", ".bash_profile", ".zshrc", ".zprofile", ".profile" },
    callback = function(args) vim.bo[args.buf].filetype = "sh" end,
})

-- Auto format before saving file
vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    pattern = "*",
    callback = function()
        local conform = require("conform")
        -- Shared formatting options
        local format_opts = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
        }
        conform.format(format_opts)
    end,
})

-- Enable inlay hints when LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
    group = augroup,
    callback = function() vim.lsp.inlay_hint.enable() end,
})

-- Open Troubles Quickfix when the qf list opens
vim.api.nvim_create_autocmd("BufRead", {
    group = augroup,
    callback = function(args)
        if vim.bo[args.buf].buftype == "quickfix" then
            vim.schedule(function()
                vim.cmd.cclose()
                vim.cmd.Trouble("qflist open")
            end)
        end
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup,
    desc = "Highlight on Yank",
    callback = function()
        vim.hl.on_yank({
            higroup = "Visual",
            timeout = 300,
        })
    end,
})

-- Start treesitter for all filetypes that have a parser installed
vim.api.nvim_create_autocmd("FileType", {
    group = augroup,
    callback = function(args) pcall(vim.treesitter.start, args.buf) end,
})

-- Open help in a vertical split when using the :help command
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = augroup,
    callback = function(args)
        if vim.bo[args.buf].filetype ~= "help" then return end

        vim.cmd.wincmd("L")
    end,
})

-- Highlight yanked text
-- Command to get lsp info
vim.api.nvim_create_user_command("LspInfo", function() vim.cmd.checkhealth("vim.lsp") end, {
    desc = "Show LSP Information",
})

vim.diagnostic.config({
    virtual_text = true,
})
