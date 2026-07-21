vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.termguicolors = true

vim.opt.updatetime = 500

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.shell = "bash"
vim.opt.wrap = false

vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = true

vim.g.health = { style = "float" } -- opens checkhealth window as floating window instead of opening of a new tab.

-- Session state to save and restore using auto-session plugin
vim.opt.sessionoptions = {
    "buffers", -- Save hidden and unloaded buffers.
    "curdir", -- Restore the current working directory.
    "folds", -- Save fold states.
    "help", -- Restore help windows.
    "winsize", -- Restore window sizes.
    "winpos", -- Restore the GUI window position
    "terminal", -- Restore terminal buffers.
    "localoptions", -- Restore window- and buffer-local options.
}

-- Options controlling the completion popup menu.
vim.opt.completeopt = {
    "menu", -- Show the completion menu when there are multiple matches.
    "menuone", -- Show the menu even if there is only one match.
    "noinsert", -- Don't automatically insert the first completion candidate.
    "popup", -- Show extra completion information in a floating popup instead of the preview window (when supported).
}
