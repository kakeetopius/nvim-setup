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

vim.keymap.set("n", "<leader>dl", function()
  vim.ui.input({ prompt = "Enter client ID to stop: " }, function(input_id)
    if not input_id then
      print("Cancelled.")
      return
    end

    local client_id = tonumber(input_id)
    if not client_id then
      print("Invalid client ID.")
      return
    end

    vim.ui.input({ prompt = "Enter buffer number (or leave empty for current): " }, function(input_buf)
      local bufnr = tonumber(input_buf) or vim.api.nvim_get_current_buf()
      local client = vim.lsp.get_client_by_id(client_id)

      if client and vim.lsp.get_active_clients({ bufnr = bufnr }) then
        client.stop()
        print("Stopped LSP client '" .. client.name .. "' (id: " .. client.id .. ")")
      else
        print("No LSP client with ID " .. client_id .. " found for buffer " .. bufnr)
      end
    end)
  end)
end, { desc = "Detach & Stop LSP by client ID and buffer" })


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

