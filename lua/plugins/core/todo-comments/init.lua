return {
	"folke/todo-comments.nvim",
	-- lazy = true,
	event = "VimEnter",
	opts = { signs = false },
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"folke/trouble.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			opts = {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			},
		},
	},
}
