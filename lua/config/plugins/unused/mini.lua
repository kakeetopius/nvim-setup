return {
    -- different nvim setups like status line	
    {
	'echasnovski/mini.nvim',
	config = function()
	    local statusline = require 'mini.statusline'
	    statusline.setup({use_icons = true})
	end
    },

}

