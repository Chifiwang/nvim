-- return {
--     'mfussenegger/nvim-dap',
--     -- lazy = true,
--     -- event = 'BufEnter *.*',
--     dependencies = {
--         {
--             'rcarriga/nvim-dap-ui',
--             dependencies = {"nvim-neotest/nvim-nio"},
--
--         }
--     },
--     config = function ()
--         require 'plugins.dap.manager.nvim-dap.conf'
--     end
-- }
return {
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("plugins.dap.manager.nvim-dap.conf")
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
			ensure_installed = {
				"codelldb",
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
	},
}
