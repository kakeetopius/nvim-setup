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
    callback = function(args)
        if vim.bo[args.buf].buftype == "quickfix" then
            vim.schedule(function()
                vim.cmd("cclose")
                vim.cmd("Trouble qflist open")
            end)
        end
    end,
})

vim.diagnostic.config({
    virtual_text = true,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight on Yank",
    callback = function()
        vim.hl.on_yank({
            higroup = "Visual",
            timeout = 300,
        })
    end,
})

-- Make nvim recognise some files as html
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.html.tmpl", "*.tmpl" },
    callback = function(args) vim.bo[args.buf].filetype = "html" end,
})

-- Start treesitter for all filetypes that have a parser installed
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args) pcall(vim.treesitter.start, args.buf) end,
})

-- Command to get lsp info
vim.api.nvim_create_user_command("LspInfo", function() vim.cmd("checkhealth vim.lsp") end, {
    desc = "Show LSP Information",
})

-- Command to open help in a vertical split
vim.api.nvim_create_user_command("Help", function()
    local topic = vim.fn.input({
        prompt = "Help For: ",
        completion = "help",
    })
    if topic ~= nil then vim.cmd("vertical help " .. vim.fn.fnameescape(topic)) end
end, {
    desc = "Open help in a vertical split",
})

-- Open help in a vertical split when using the :help command
vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    callback = function() vim.cmd("wincmd L") end,
})
