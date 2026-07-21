return {
    "rmagatti/auto-session",
    lazy = false,
    keys = {
        -- Will use Telescope if installed or a vim.ui.select picker otherwise
        { "<leader>ar", "<cmd>AutoSession search<CR>", desc = "Session search" },
        { "<leader>as", "<cmd>AutoSession save<CR>", desc = "Save session" },
        { "<leader>aa", "<cmd>AutoSession toggle<CR>", desc = "Toggle session autosave" },
    },
    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        session_lens = {
            picker = "snacks",
        },
        -- log_level = 'debug',
    },
}
