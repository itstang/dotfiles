return {
	"folke/snacks.nvim",
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
	},
}
