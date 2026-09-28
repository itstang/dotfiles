return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		input = {
			enabled = true,
		},
		picker = {
			enabled = true,
			sources = {
				marks = {
					transform = function(item) return item.label:match("%a") ~= nil end,
				},
			},
			win = {
				input = {
					keys = { ["<Esc>"] = { "close", mode = { "n", "i" } } },
				},
			},
			layout = { preset = "chad" },
			layouts = {
				chad = {
					reverse = true,
					layout = {
						box = "horizontal",
						backdrop = false,
						width = 0.8,
						height = 0.8,
						{
							box = "vertical",
							{
								win = "list",
								title = "{title} {live} {flags}",
								title_pos = "left",
								border = "solid",
							},
							{
								win = "input",
								height = 1,
								border = "solid",
							},
						},
						{
							win = "preview",
							title = "{preview}",
							title_pos = "left",
							border = "solid",
							width = 0.5,
						},
					},
				},
			},
		},
		notifier = {
			enabled = true,
			top_down = true,
		},
		indent = {
			enabled = true,
			indent = {
				enabled = false,
			},
			animate = {
				style = "up_down",
			},
			chunk = {
				enabled = true,
				hl = "SnacksIndent3",
				char = {
					corner_top = "╭",
					corner_bottom = "╰",
					horizontal = "─",
					vertical = "│",
					arrow = "",
				},
			},
		},
	},
	keys = {
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>fh", function() Snacks.picker.help() end, desc = "Help pages" },
		{ "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent files" },
		{ "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
		{ "<leader>fm", function() Snacks.picker.marks() end, desc = "Marks" },

		-- Git
		{ "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
		{ "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git log" },
		{ "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
		{ "<leader>gf", function() Snacks.picker.git_files() end, desc = "Git Files" },
	},
}
