return {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	config = function()
		require("kanagawa").setup({
			transparent = true,
			overrides = function(colors)
				local theme = colors.theme
				return {
					BlinkCmpMenu = { bg = theme.ui.float.bg }, -- sumiInk0, matches Lazy/float panels
					BlinkCmpMenuBorder = { fg = theme.ui.float.fg_border, bg = theme.ui.float.bg }, -- muted border, no waveBlue
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
		vim.cmd("colorscheme kanagawa")
	end,
}
