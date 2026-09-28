return {
	{
		"nvim-mini/mini.animate",
		version = false,
		event = "VeryLazy",
		opts = function()
			local animate = require("mini.animate")

			return {
				cursor = {
					enable = false,
				},
				scroll = {
					enable = true,
					timing = animate.gen_timing.cubic({
						duration = 150,
						unit = "total",
					}),
				},
			}
		end,
	},
	{
		"sphamba/smear-cursor.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"sitiom/nvim-numbertoggle",
		event = "VeryLazy",
	},
	{
		"szw/vim-maximizer",
		keys = {
			{ "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
		},
	},
	{
		"brenoprata10/nvim-highlight-colors",
		event = "VeryLazy",
		opts = {},
	},
}
