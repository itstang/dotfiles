return {
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		config = function()
			local autopairs = require("nvim-autopairs")

			autopairs.setup({
				check_ts = true,
				ts_config = {
					lua = { "string" },
					javascript = { "template_string" },
					java = false,
				},
			})
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},
}
