return {
	"nvim-mini/mini.files",
	version = false,
	opts = {
		options = {
			use_as_default_explorer = false,
		},
		windows = {
			preview = true,
			width_preview = 50,
		},
	},
	keys = {
		{
			"<leader>em",
			function()
				if not require("mini.files").close() then
					require("mini.files").open(vim.api.nvim_buf_get_name(0))
				end
			end,
			desc = "Toggle file explorer",
		},
	},
}
