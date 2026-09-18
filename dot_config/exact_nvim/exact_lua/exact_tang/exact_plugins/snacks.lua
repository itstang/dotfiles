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
			win = {
				input = {
					keys = { ["<Esc>"] = { "close", mode = { "n", "i" } } },
				},
			},
		},
		notifier = {
			enabled = true,
			top_down = false,
		},
	},
	keys = {
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>fh", function() Snacks.picker.help() end, desc = "Help pages" },
		{ "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent files" },
		{ "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagonistics" },

		-- Git
		{ "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
		{ "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git log" },
		{ "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
		{ "<leader>gf", function() Snacks.picker.git_files() end, desc = "Git Files" },
	},
}
