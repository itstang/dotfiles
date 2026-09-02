return {
	"rmagatti/auto-session",
	lazy = false,
	opts = {
		suppressed_dirs = { "~/", "~/Develop", "~/Downloads", "~/Documents", "~/Desktop/" },
		auto_restore = false,
	},
	keys = {
		{ "<leader>wr", "<cmd>AutoSession restore<CR>", desc = "Restore session for cwd" },
		{ "<leader>ws", "<cmd>AutoSession save<CR>", desc = "Save session for auto session root dir" },
	},
}
