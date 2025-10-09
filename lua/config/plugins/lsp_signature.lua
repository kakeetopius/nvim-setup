return {
    {
	"ray-x/lsp_signature.nvim",
	event = "InsertEnter",
	opts = {
	    bind = true,
	    hint_enable = true,
	    floating_window = true,
	    wrap = true,
	    handler_opts = {
		border = "rounded"
	    }
	},
    }
}
