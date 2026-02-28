-- KEYMAP TABLE Format:
-- { mode, lhs, rhs, description }

local mappings = {
    -- INSERT MODE NAVIGATION
    { "i", "<C-b>", "<ESC>I", "move beginning of line" },
    { "i", "<C-e>", "<ESC>A", "move end of line" },
    { "i", "<C-h>", "<Left>", "move left" },
    { "i", "<C-l>", "<Right>", "move right" },
    { "i", "<C-j>", "<Down>", "move down" },
    { "i", "<C-k>", "<Up>", "move up" },

    -- QUICKFIXLIST
    { "n", "]q", "<cmd>cnext<CR>", "go to next item in quickfix list" },
    { "n", "[q", "<cmd>cprev<CR>", "go to previous item in quickfix list" },

    -- TMUX HOME / END FIX
    { "n", "<Find>", "^", "" },
    { "n", "<Select>", "$", "" },
    { "i", "<Find>", "<C-o>^", "" },
    { "i", "<Select>", "<C-o>$", "" },
    { "v", "<Find>", "^", "" },
    { "v", "<Select>", "$", "" },

    -- LSP
    { { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Show available code actions" },
    { "n", "<leader>rn", vim.lsp.buf.rename, "Smart rename" },
    { "n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics" },
    { "n", "K", vim.lsp.buf.hover, "Show documentation for what is under cursor" },
    { "n", "<leader>lr", "<cmd>LspRestart<CR>", "Restart LSP" },

    -- FILE EXPLORER
    { "n", "<leader>e", "<cmd>Neotree left toggle<CR>", "Toogle File Explorer" },
    { "n", "<M-f>", "<cmd>Neotree float <CR>", "Open NeoTree Float" },

    -- SPLITS / TERMINAL / RUN
    { "n", "<leader>rs", [[:!]], "Enter run mode (shell command)" },
    { "n", "<leader>vv", "<cmd>vsplit<CR>", "Vertically Split Screen" },
    { "n", "<leader>vh", "<cmd>split<CR>", "Horizontally Split Screen" },
    { "n", "<leader>tt", "<cmd>terminal<CR>", "Toogle Terminal" },
    { { "n", "v" }, "<leader>nh", "<cmd>nohlsearch<CR>", "Remove highlight for search" },
    { "t", "<C-Space>", [[<C-\><C-n>]], "Go to normal mode from terminal mode" },

    -- BUFFER MANAGEMENT (barbar)
    { "n", "<A-l>", "<Cmd>BufferPrevious<CR>", "Go to Previous Buffer" },
    { "n", "<A-k>", "<Cmd>BufferNext<CR>", "Go to Next Buffer" },
    { "n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", "Move the Buffer to the left." },
    { "n", "<A->>", "<Cmd>BufferMoveNext<CR>", "Move the Buffer to the right" },

    { "n", "<M-1>", "<Cmd>BufferGoto 1<CR>", "Go to Buffer 1" },
    { "n", "<M-2>", "<Cmd>BufferGoto 2<CR>", "Go to Buffer 2" },
    { "n", "<M-3>", "<Cmd>BufferGoto 3<CR>", "Go to Buffer 3" },
    { "n", "<M-4>", "<Cmd>BufferGoto 4<CR>", "Go to Buffer 4" },
    { "n", "<M-5>", "<Cmd>BufferGoto 5<CR>", "Go to Buffer 5" },
    { "n", "<M-6>", "<Cmd>BufferGoto 6<CR>", "Go to Buffer 6" },
    { "n", "<M-7>", "<Cmd>BufferGoto 7<CR>", "Go to Buffer 7" },
    { "n", "<M-8>", "<Cmd>BufferGoto 8<CR>", "Go to Buffer 8" },
    { "n", "<M-9>", "<Cmd>BufferGoto 9<CR>", "Go to Buffer 9" },
    { "n", "<M-0>", "<Cmd>BufferLast<CR>", "Go to last buffer." },

    { "n", "<A-p>", "<Cmd>BufferPin<CR>", "Pin the current buffer" },
    { "n", "<A-c>", "<Cmd>BufferClose<CR>", "Close the current buffer" },
    { "n", "<A-q>", "<Cmd>BufferPick<CR>", "Toggle buffer picker" },

    -- TAB MANAGEMENT
    { "n", "<Leader>tn", ":tabnew<CR>", "Open a new tab" },
    { "n", "<Leader>tc", ":tabclose<CR>", "Close tab" },

    -- TELEKASTEN (Markdown)
    { "n", "<leader>zp", "<cmd>Telekasten panel<CR>", "Toggle Telekasten panel" },
    { "n", "<leader>zf", "<cmd>Telekasten find_notes<CR>", "Find Telekasten notes" },
    { "n", "<leader>zg", "<cmd>Telekasten search_notes<CR>", "Search Telekasten notes" },
    { "n", "<leader>zd", "<cmd>Telekasten goto_today<CR>", "Go to Today's notes." },
    { "n", "<leader>zz", "<cmd>Telekasten follow_link<CR>", "Telekasten follow link" },
    { "n", "<leader>zn", "<cmd>Telekasten new_note<CR>", "Create new Telekasten note" },
    { "n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>", "Show calender" },
    { "n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>", "Telekasten show back links" },
    { "n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>", "Telekasten insert image" },

    -- MARK MANAGEMENT
    { "n", "<leader>dM", ":delmarks a-z<CR>", "Clear local marks" },
    {
        "n",
        "<leader>dm",
        function()
            vim.ui.input({ prompt = "Enter mark: " }, function(input)
                local bufno = vim.api.nvim_get_current_buf()
                vim.api.nvim_buf_set_mark(bufno, input, 0, 0, {})
            end)
        end,
        "Delete a mark.",
    },

    -- NOTIFY
    { "n", "<leader>nn", "<cmd>Telescope notify<CR>", "View notification History" },
    {
        "n",
        "<leader>nd",
        function() require("notify").dismiss({ silent = true, pending = true }) end,
        "Dismiss notifications",
    },

    -- ========================
    -- DEBUGGING (DAP)
    -- ========================
    {
        "n",
        "<leader>dc",
        function() require("dap").continue() end,
        "Run/Continue",
    },
    {
        "n",
        "<leader>dC",
        function() require("dap").run_to_cursor() end,
        "Run to Cursor",
    },

    {
        "n",
        "<leader>do",
        function() require("dap").step_over() end,
        "Step Over",
    },
    {
        "n",
        "<leader>di",
        function() require("dap").step_into() end,
        "Step Into",
    },
    {
        "n",
        "<leader>dO",
        function() require("dap").step_out() end,
        "Step Out",
    },
    {
        "n",
        "<leader>dj",
        function() require("dap").up() end,
        "Down",
    },
    {
        "n",
        "<leader>dk",
        function() require("dap").down() end,
        "Up",
    },
    {
        "n",
        "<leader>db",
        function() require("dap").toggle_breakpoint() end,
        "Toggle Breakpoint",
    },
    {
        "n",
        "<leader>dB",
        function() require("dap").set_breakpoint() end,
        "Set Breakpoint",
    },
    {
        "n",
        "<leader>dt",
        function() require("dap").terminate() end,
        "Terminate",
    },
    {
        "n",
        "<leader>ds",
        function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.scopes)
        end,
        "Session / Scopes",
    },
    {
        "n",
        "<leader>dr",
        function() require("dap").repl.toggle() end,
        "Toggle REPL",
    },
    {
        "n",
        "<Leader>dl",
        function() require("dap").run_last() end,
        "Run Last",
    },
    {
        { "n", "v" },
        "<Leader>dh",
        function() require("dap.ui.widgets").hover() end,
        "Hover widgets",
    },
    {
        { "n", "v" },
        "<Leader>dp",
        function() require("dap.ui.widgets").preview() end,
        "Preview widgets",
    },
    {
        "n",
        "<Leader>df",
        function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.frames)
        end,
        "Debug window with centered float",
    },
    {
        "n",
        "<leader>du",
        function() require("dapui").toggle({}) end,
        "Dap UI",
    },
    {
        { "n", "x" },
        "<leader>de",
        function() require("dapui").eval() end,
        "Eval",
    },

    -- ========================
    -- TODO COMMENTS
    -- ========================
    {
        "n",
        "]c",
        function() require("todo-comments").jump_next() end,
        "Next todo comment",
    },
    {
        "n",
        "[c",
        function() require("todo-comments").jump_prev() end,
        "Previous todo comment",
    },

    --GIT
    { "n", "<leader>gU", "<cmd>Gitsigns blame<CR>", "Open Git blame window" },
}

for _, map_def in ipairs(mappings) do
    local mode, lhs, rhs, desc = table.unpack(map_def)
    local opts = { desc = desc or "", noremap = true, silent = true }

    vim.keymap.set(mode, lhs, rhs, opts)
end
