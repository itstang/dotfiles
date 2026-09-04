return {
	"nvim-mini/mini.files",
	version = false,
	opts = {
		mappings = {
			go_in_plus = "<CR>",
		},
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
				local MiniFiles = require("mini.files")
				if not MiniFiles.close() then
					MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
					MiniFiles.reveal_cwd()
				end
			end,
			desc = "Toggle file explorer",
		},
	},
}
