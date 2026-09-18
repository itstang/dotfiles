return {
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			timeout = 1500,
		},
	},
	{
		"tris203/precognition.nvim",
		event = "VeryLazy",
		opts = {
			startVisible = true,
			showBlankVirtLine = false,
			targetedMotionHints = {
				enabled = false,
			},
			hints = {
				Zero = { prio = 0 },
			},
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
	},
}
