return {
    {
        -- The Debug Adapter Protocol.
        "mfussenegger/nvim-dap",
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        opts = {},
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup(opts)
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open({})
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close({})
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close({})
            end
        end,
    },

    -- Debug installation options.
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "mason.nvim",
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
            automatic_installation = true,

            ensure_installed = {
                "python",
                "delve",
            },
        },
    },

    -- virtual text for the debugger
    {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
    },

    -- Go specific debug options/configurations.
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = {
            "mfussenegger/nvim-dap",
        },

        config = function()
            require("dap-go").setup()
        end,
    },

    {
        "mfussenegger/nvim-dap-python",
        config = function()
            require("dap-python").setup("debugpy-adapter")
        end,
    },

    {
        "julianolf/nvim-dap-lldb",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            require("dap-lldb").setup()
        end,
    },
}
