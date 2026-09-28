local function apply_picker_highlights(p)
	local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal", link = false }).bg or "NONE"
	local float_bg = vim.api.nvim_get_hl(0, { name = "NormalFloat", link = false }).bg or normal_bg
	local prompt_bg = vim.api.nvim_get_hl(0, { name = "CursorLine", link = false }).bg or float_bg
	local highlights = {
		FFFBorder = { fg = float_bg, bg = float_bg },
		FFFPrompt = { link = "CursorLine" },
		FFFPromptBorder = { fg = prompt_bg, bg = prompt_bg },
		FFFPromptPrefix = { fg = p.red },
		FFFTitle = { fg = p.black, bg = p.red, bold = true },
		FFFPreviewTitle = { fg = p.black, bg = p.green, bold = true },
		FFFMatching = { fg = p.blue, bold = true },
		SnacksPicker = { link = "NormalFloat" },
		SnacksPickerBorder = { link = "FFFBorder" },
		SnacksPickerBoxBorder = { link = "FFFBorder" },
		SnacksPickerListBorder = { link = "FFFBorder" },
		SnacksPickerPreviewBorder = { link = "FFFBorder" },
		SnacksPickerInput = { link = "FFFPrompt" },
		SnacksPickerInputBorder = { link = "FFFPromptBorder" },
		SnacksPickerListTitle = { link = "FFFTitle" },
		SnacksPickerPrompt = { link = "FFFPromptPrefix" },
		SnacksPickerPreviewTitle = { link = "FFFPreviewTitle" },
		SnacksPickerMatch = { link = "FFFMatching" },
		SnacksPickerListCursorLine = { link = "Visual" },
	}
	for name, highlight in pairs(highlights) do
		vim.api.nvim_set_hl(0, name, highlight)
	end
end

return {
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
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
		end,
	},
	{
		"dgox16/oldworld.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local p = require("oldworld.variants")("default")
			local ultraviolet = "#a277ff"
			vim.api.nvim_create_autocmd("ColorScheme", {
				group = vim.api.nvim_create_augroup("tang_picker_highlights", { clear = true }),
				callback = function() apply_picker_highlights(p) end,
			})
			require("oldworld").setup({
				styles = {
					comments = { italic = true, bold = false },
					booleans = { italic = true, bold = true },
				},
				highlight_overrides = {
					Keyword = { fg = ultraviolet, italic = true },
					Constant = { fg = p.purple },
					Identifier = { fg = p.blue },
					Structure = { fg = p.blue },
					Type = { fg = p.yellow, italic = true },
					["@lsp.type.namespace"] = { fg = p.magenta },
					["@keyword.import"] = { fg = p.magenta },
					FloatTitle = { fg = ultraviolet },
				},
			})
			vim.cmd.colorscheme("oldworld")
		end,
	},
}
