return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = true,
	cmd = "ToggleTerm",
	keys = {
		{ "<leader>nt", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
		{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Toggle horizontal terminal" },
		{ "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", desc = "Toggle vertical terminal" },
		{ "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", desc = "Toggle floating terminal" },
		{ "<leader>t1", "<cmd>ToggleTerm 1<CR>", desc = "Toggle terminal 1" },
		{ "<leader>t2", "<cmd>ToggleTerm 2<CR>", desc = "Toggle terminal 2" },
		{ "<leader>t3", "<cmd>ToggleTerm 3<CR>", desc = "Toggle terminal 3" },
		{ "<leader>t4", "<cmd>ToggleTerm 4<CR>", desc = "Toggle terminal 4" },
		{ "<Esc>", "<C-\\><C-n>", mode = "t", desc = "Exit terminal mode" },
	},
}
