return {
	"m4xshen/hardtime.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		timeout = 1500,
	},
	config = function()
		vim.notify = require("notify")
		require("hardtime").setup()
	end,
}
