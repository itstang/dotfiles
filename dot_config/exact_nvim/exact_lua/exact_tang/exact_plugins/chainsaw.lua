return {
	"chrisgrieser/nvim-chainsaw",
	event = "VeryLazy",
	keys = {
		{ "<leader>lg", function() require("chainsaw").variableLog() end, desc = "Log variable" },
	},
	opts = {},
}
