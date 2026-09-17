return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({ virtual_text = false })

			vim.keymap.set("n", "<leader>dt", "<cmd>TinyInlineDiag toggle<cr>", { desc = "Toggle diagnostics" })
		end,
	},
	{
		"rachartier/tiny-cmdline.nvim",
		config = function()
			vim.o.cmdheight = 0
			require("tiny-cmdline").setup()
		end,
	},
}
