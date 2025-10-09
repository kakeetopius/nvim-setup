--barbecue.nvim — shows a breadcrumb-style line at the top of the window that 
--tells exactly where I am in the code (like which function or class I’m in). 

return {
    {
      "utilyre/barbecue.nvim",
      name = "barbecue",
      version = "*",
      dependencies = {
	"SmiteshP/nvim-navic",
	"nvim-tree/nvim-web-devicons", -- optional dependency
      },
      opts = {
	-- configurations go here
      },
    }
} 
