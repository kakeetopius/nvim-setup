vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
--run current line
vim.keymap.set("n", "<space>x", ":.lua<CR>")
--run block in visual mode
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
vim.keymap.set("n", "<leader>r", [[:!]], { desc = "Enter run (shell command) mode" })
vim.keymap.set("n", "<leader>vs", "<cmd>vsplit<CR>", { desc = "Vertical Split of screen" })
vim.keymap.set("n", "<leader>t", "<cmd>terminal<CR>", { desc = "Toggle Terminal" })
vim.keymap.set("n", "<C-k>", "<cmd>bprev<CR>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "<C-j>", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set({ "n", "v" }, "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "Remove highlight for search" })
