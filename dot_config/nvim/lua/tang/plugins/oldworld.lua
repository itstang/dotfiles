return {
	"dgox16/oldworld.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("oldworld").setup({
			variant = "oled",
			styles = {
				comments = { italic = true, bold = false },
				booleans = { italic = true, bold = true },
			},
			highlight_overrides = {
				keyword = { fg = "#a277ff", italic = true },
				Function = { fg = "#a277ff" },
				FloatTitle = { fg = "#a277ff" },
				SnacksPickerBorder = { fg = "#a277ff" },
			},
		})
		vim.cmd.colorscheme("oldworld")
	end,
}
