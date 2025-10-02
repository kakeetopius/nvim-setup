-- Show diagnostics on cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "rounded",
            source = "always",
            prefix = "",
            scope = "cursor"
        })
    end
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.php",
    callback = function()
      vim.bo.filetype = "php"
      vim.bo.indentexpr = ""        -- Disable filetype indent plugin logic
      vim.bo.autoindent = true
      vim.bo.smartindent = true

      -- Set tab to 4 spaces
      vim.bo.shiftwidth = 4         -- Indentation size when indenting (>>)
      vim.bo.tabstop = 4            -- A tab character displays as 4 spaces
      vim.bo.softtabstop = 4        -- Number of spaces when pressing <Tab>
      vim.bo.expandtab = true       -- Convert tabs to spaces
    end,
  })

-- Make nvim recognise some files as shell
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { ".bashrc", ".bash_profile", ".zshrc", ".zprofile", ".profile"},
  callback = function()
    vim.bo.filetype = "sh"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.bo.expandtab = false  -- use tabs, not spaces (Go standard)
    vim.bo.shiftwidth = 5     -- indent operations = 4 spaces
    vim.bo.tabstop = 4        -- a tab character looks like 4 spaces
    vim.bo.softtabstop = 4    -- <Tab> feels like 4 spaces when editing
  end,
})
