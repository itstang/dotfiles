return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
			group = vim.api.nvim_create_augroup("macro_status", {}),
			callback = function(ev)
				rec = ev.event == "RecordingEnter" and vim.fn.reg_recording() or nil
				lualine.refresh({ place = { "statusline" } })
			end,
		})

		lualine.setup({
			options = {
				theme = "horizon",
				section_separators = { left = "", right = "" },
				component_separators = "",
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "", right = "" }, right_padding = 2 },
				},
				lualine_b = {
					{
						function() return "󰑊 recording @" .. rec end,
						cond = function() return rec ~= nil end,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
		})
	end,
}
