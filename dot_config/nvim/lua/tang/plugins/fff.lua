return {
	"dmtrKovalenko/fff",
	build = function()
		-- downloads a prebuilt binary or falls back to cargo build
		require("fff.download").download_or_build_binary()
	end,
	opts = {
		prompt = " ",
		keymaps = {
			move_up = { "<Up>", "<C-k>" },
			move_down = { "<Down>", "<C-j>" },
		},
		debug = {
			enabled = true,
			show_scores = false,
			show_file_info = {
				score_breakdown = false,
			},
		},
		layout = {
			prompt_position = "top",
			border = "rounded",
		},
		git = {
			status_text_color = true,
		},
	},
	lazy = false, -- the plugin lazy-initialises itself
	keys = {
		{
			"ff",
			function()
				require("fff").find_files()
			end,
			desc = "FFFind files",
		},
		{
			"fg",
			function()
				require("fff").live_grep()
			end,
			desc = "LiFFFe grep",
		},
		{
			"fz",
			function()
				require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
			end,
			desc = "Live fffuzy grep",
		},
		{
			"fc",
			function()
				require("fff").live_grep({ query = vim.fn.expand("<cword>") })
			end,
			desc = "Search current word",
		},
	},
}
