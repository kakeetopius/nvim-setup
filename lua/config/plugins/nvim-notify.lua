--nvim-notify -> a notification manager for nvim
return {
    "rcarriga/nvim-notify",

    config = function()
        local notify = require("notify")

        local opts = {
            timeout = 5000, -- ms
            stages = "fade", -- animation
        }
        notify.setup(opts)
        vim.notify = notify
    end,
}
