return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		require("mini.icons").mock_nvim_web_devicons()
		vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
			group = vim.api.nvim_create_augroup("macro_status", {}),
			callback = function() lualine.refresh({ place = { "statusline" } }) end,
		})

		lualine.setup({
			options = {
				theme = "auto",
				section_separators = { left = "", right = "" },
				component_separators = "",
				disabled_filetypes = { statusline = { "alpha" } },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						separator = { left = "", right = "" },
						right_padding = 2,
						color = function()
							if vim.fn.mode():sub(1, 1) == "i" then return { bg = "#a277ff" } end
						end,
					},
				},
				lualine_b = {
					{ "branch", icon = "" },
					{
						function() return "󰑊 recording @" .. vim.fn.reg_recording() end,
						cond = function() return vim.fn.reg_recording() ~= "" end,
						color = { fg = "#f5a191" },
					},
				},
				lualine_c = {
					{ "filename", path = 1 },
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#f5a191" },
					},
					{ "fileformat" },
					{ "filetype" },
				},
				lualine_y = {
					{ "diagnostics" },
				},
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
		})
	end,
}
