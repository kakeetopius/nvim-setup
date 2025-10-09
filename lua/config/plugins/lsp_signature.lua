return {
    {
	"ray-x/lsp_signature.nvim",
	event = "InsertEnter",
	opts = {
	    bind = true,
	    hint_enable = false,
	    floating_window = true,
	    wrap = true,
	    handler_opts = {
		border = "rounded"
	    },
	    toggle_key = '<C-x>'
	},
    }
}
