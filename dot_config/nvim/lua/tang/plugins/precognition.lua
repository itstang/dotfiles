return {
	"tris203/precognition.nvim",
	event = "VeryLazy",
	opts = {
		startVisible = true,
	},
	keys = {
		{
			"<leader>p",
			function()
				local enabled = require("precognition").toggle()
				vim.notify("Precognition " .. (enabled and "on" or "off"))
			end,
			desc = "Toggle Precognition",
		},
	},
}
