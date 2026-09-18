return {
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				transparent = true,
				overrides = function(colors)
					local theme = colors.theme
					return {
						BlinkCmpMenu = { bg = theme.ui.float.bg },
						BlinkCmpMenuBorder = { fg = theme.ui.float.fg_border, bg = theme.ui.float.bg },
						BlinkCmpMenuSelection = { bg = theme.ui.bg_search, bold = true },
					}
				end,
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
			})
			-- vim.cmd("colorscheme kanagawa")
		end,
	},
	{
		"dgox16/oldworld.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local p = require("oldworld.palette")
			local ultraviolet = "#a277ff"
			require("oldworld").setup({
				variant = "oled",
				styles = {
					comments = { italic = true, bold = false },
					booleans = { italic = true, bold = true },
				},
				highlight_overrides = {
					Keyword = { fg = ultraviolet, italic = true },
					String = { fg = p.purple },
					Function = { fg = ultraviolet },
					FloatTitle = { fg = ultraviolet },
					SnacksPickerBorder = { fg = ultraviolet },
				},
			})
			vim.cmd.colorscheme("oldworld")
		end,
	},
}
