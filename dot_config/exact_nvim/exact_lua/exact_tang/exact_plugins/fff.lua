return {
	"dmtrKovalenko/fff",
	build = function()
		-- downloads a prebuilt binary or falls back to cargo build
		require("fff.download").download_or_build_binary()
	end,
	opts = {
		prompt = " ",
		title = "Files",
		keymaps = {
			move_up = { "<Up>", "<C-k>" },
			move_down = { "<Down>", "<C-j>" },
		},
		debug = {
			enabled = false,
			show_scores = false,
			show_file_info = {
				score_breakdown = false,
			},
		},
		layout = {
			prompt_position = "bottom",
			border = "rounded",
		},
		preview = {
			line_numbers = true,
		},
		git = {
			status_text_color = true,
		},
		hl = {
			title = "FFFTitle",
			prompt = "FFFPromptPrefix",
			matched = "FFFMatching",
			winhl = {
				prompt = "Normal:FFFPrompt,FloatBorder:FFFPromptBorder",
				list = "Normal:NormalFloat,FloatBorder:FFFBorder,FloatTitle:FFFTitle",
				preview = "Normal:NormalFloat,FloatBorder:FFFBorder,FloatTitle:FFFPreviewTitle",
				file_info = "Normal:NormalFloat,FloatBorder:FFFBorder,FloatTitle:FFFPreviewTitle",
			},
		},
	},
	lazy = false, -- the plugin lazy-initialises itself
	keys = {
		{
			"<leader>ff",
			function() require("fff").find_files() end,
			desc = "Find files",
		},
		{
			"<leader>fg",
			function() require("fff").live_grep() end,
			desc = "Live grep",
		},
		{
			"<leader>fz",
			function() require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } }) end,
			desc = "Fuzzy grep",
		},
		{
			"<leader>fc",
			function() require("fff").live_grep_under_cursor() end,
			mode = { "n", "x" },
			desc = "Search current word or selection",
		},
	},
}
