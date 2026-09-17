return {
	{
		"karb94/neoscroll.nvim",
		opts = {
			duration_multiplier = 0.25,
		},
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
	{
		"sitiom/nvim-numbertoggle",
	},
	{
		"szw/vim-maximizer",
		keys = {
			{ "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
		},
	},
	{
		"brenoprata10/nvim-highlight-colors",
		config = function() require("nvim-highlight-colors").setup({}) end,
	},
}
