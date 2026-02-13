vim.g.mapleader = " "
local map = vim.keymap.set
local opts = { noremap = true }

map("i", "<C-b>", "<ESC>I", { desc = "move beginning of line" })
map("i", "<C-e>", "<ESC>A", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- Due to weird tmux behaviour with Home and End buttons
map("n", "<Find>", "^", opts)
map("n", "<Select>", "$", opts)
map("i", "<Find>", "<C-o>^", opts)
map("i", "<Select>", "<C-o>$", opts)
map("v", "<Find>", "^", opts)
map("v", "<Select>", "$", opts)

opts.desc = "Show available code actions"
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

opts.desc = "Smart rename"
map("n", "<leader>rn", vim.lsp.buf.rename, opts)

opts.desc = "Show buffer diagnostics"
map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

opts.desc = "Show documentation for what is under cursor"
map("n", "K", vim.lsp.buf.hover, opts)

opts.desc = "Restart LSP"
map("n", "<leader>lr", "<cmd>LspRestart<CR>", opts)

opts.desc = "Toogle File Explorer"
map("n", "<leader>e", "<cmd>Neotree left toggle<CR>", opts)

opts.desc = "Open NeoTree Float"
map("n", "<M-f>", "<cmd>Neotree float <CR>", opts)

opts.desc = "Enter run mode (shell command)"
map("n", "<leader>rs", [[:!]], opts)

opts.desc = "Vertically Split Screen"
map("n", "<leader>vs", "<cmd>vsplit<CR>", opts)

opts.desc = "Toogle Terminal"
map("n", "<leader>tt", "<cmd>terminal<CR>", opts)

opts.desc = "Remove highlight for search"
map({ "n", "v" }, "<leader>nh", "<cmd>nohlsearch<CR>", opts)

opts.desc = "Go to normal mode from terminal mode"
map("t", "<C-Space>", [[<C-\><C-n>]], opts)

-- buffer / tab management keymaps by barbar.nvim
-- Move to previous/next
opts.desc = ""
map("n", "<A-l>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-k>", "<Cmd>BufferNext<CR>", opts)

-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)

-- Goto buffer in position...
opts.desc = "Go to Buffer 1"
map("n", "<M-1>", "<Cmd>BufferGoto 1<CR>", opts)
opts.desc = "Go to Buffer 2"
map("n", "<M-2>", "<Cmd>BufferGoto 2<CR>", opts)
opts.desc = "Go to Buffer 3"
map("n", "<M-3>", "<Cmd>BufferGoto 3<CR>", opts)
opts.desc = "Go to Buffer 4"
map("n", "<M-4>", "<Cmd>BufferGoto 4<CR>", opts)
opts.desc = "Go to Buffer 5"
map("n", "<M-5>", "<Cmd>BufferGoto 5<CR>", opts)
opts.desc = "Go to Buffer 6"
map("n", "<M-6>", "<Cmd>BufferGoto 6<CR>", opts)
opts.desc = "Go to Buffer 7"
map("n", "<M-7>", "<Cmd>BufferGoto 7<CR>", opts)
opts.desc = "Go to Buffer 8"
map("n", "<M-8>", "<Cmd>BufferGoto 8<CR>", opts)
opts.desc = "Go to Buffer 9"
map("n", "<M-9>", "<Cmd>BufferGoto 9<CR>", opts)
opts.desc = "Go to last buffer."
map("n", "<M-0>", "<Cmd>BufferLast<CR>", opts)

-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)

-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)

--Pick a buffer
map("n", "<A-q>", "<Cmd>BufferPick<CR>", opts)

--tab management
opts.desc = "Open a new tab"
map("n", "<Leader>tn", ":tabnew<CR>", opts)

opts.desc = "Close tab"
map("n", "<Leader>tc", ":tabclose<CR>", opts)

-- markdown management by telekasten
-- Launch panel if nothing is typed after <leader>z
map("n", "<leader>zp", "<cmd>Telekasten panel<CR>")

map("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
map("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
map("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
map("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
map("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
map("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
map("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
map("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")

opts.desc = "Clear local marks"
map("n", "<leader>dM", ":delmarks a-z<CR>", opts)

opts.desc = "Delete a mark."
map("n", "<leader>dm", function()
    vim.ui.input({ prompt = "Enter mark: " }, function(input)
        local bufno = vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_set_mark(bufno, input, 0, 0, {})
    end)
end, opts)

--notification management by nvim-notify
opts.desc = "View notification History"
opts.noremap = false
map("n", "<leader>nn", "<cmd>Telescope notify<CR>", opts)

-- debugging keymaps.
local dap = require("dap")
opts.desc = "Run/Continue"
vim.keymap.set("n", "<leader>dc", function()
    dap.continue()
end, opts)

opts.desc = "Run to Cursor"
map("n", "<leader>dC", function()
    dap.run_to_cursor()
end, opts)

local function get_args(config)
    local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
    local args_str = type(args) == "table" and table.concat(args, " ") or args --[[@as string]]

    config = vim.deepcopy(config)
    config.args = function()
        local new_args = vim.fn.expand(vim.fn.input("Run with args: ", args_str)) --[[@as string]]
        if config.type and config.type == "java" then
            return new_args
        end
        return require("dap.utils").splitstr(new_args)
    end
    return config
end
opts.desc = "Run with Args"
map("n", "<leader>dP", function()
    dap.continue({ before = get_args })
end, opts)

opts.desc = "Step Over"
vim.keymap.set("n", "<leader>do", function()
    dap.step_over()
end, opts)

opts.desc = "Step Into"
vim.keymap.set("n", "<leader>di", function()
    dap.step_into()
end, opts)

opts.desc = "Step Out"
vim.keymap.set("n", "<leader>dO", function()
    dap.step_out()
end, opts)

opts.desc = "Down"
map("n", "<leader>dj", function()
    dap.up()
end, opts)

opts.desc = "Up"
map("n", "<leader>dk", function()
    dap.down()
end, opts)

opts.desc = "Toggle Breakpoint"
vim.keymap.set("n", "<leader>db", function()
    dap.toggle_breakpoint()
end, opts)

opts.desc = "Set Breakpoint"
vim.keymap.set("n", "<leader>dB", function()
    dap.set_breakpoint()
end, opts)

opts.desc = "Pause"
map("n", "<leader>dP", function()
    dap.pause()
end, opts)

opts.desc = "Terminate"
map("n", "<leader>dt", function()
    dap.terminate()
end, opts)

opts.desc = "Session"
map("n", "<leader>ds", function()
    dap.session()
end, opts)

opts.desc = "Toggle REPL"
vim.keymap.set("n", "<leader>dr", function()
    dap.repl.toggle()
end, opts)

opts.desc = "Run Last"
vim.keymap.set("n", "<Leader>dl", function()
    dap.run_last()
end, opts)

opts.desc = "Hover widgets"
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
    require("dap.ui.widgets").hover()
end, opts)

opts.desc = "Preview widgets"
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
    require("dap.ui.widgets").preview()
end, opts)

opts.desc = "Debug window with centered float"
vim.keymap.set("n", "<Leader>df", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.frames)
end, opts)

vim.keymap.set("n", "<Leader>ds", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
end)

opts.desc = "Dap UI"
map("n", "<leader>du", function()
    require("dapui").toggle({})
end, opts)

opts.desc = "Eval"
map({ "n", "x" }, "<leader>de", function()
    require("dapui").eval()
end, opts)
