return {
	{
		"nvim-mini/mini.ai",
		version = false,
		event = "VeryLazy",
		opts = {},
	},
	{
		"nvim-mini/mini.surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
	{
		"nvim-mini/mini.files",
		version = false,
		lazy = false,
		opts = {
			mappings = {
				go_in_plus = "<CR>",
			},
			options = {
				use_as_default_explorer = true,
			},
			windows = {
				preview = true,
				width_preview = 50,
			},
		},
		keys = {
			{
				"<leader>ef",
				function()
					local MiniFiles = require("mini.files")
					if not MiniFiles.close() then
						MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
						MiniFiles.reveal_cwd()
					end
				end,
				desc = "Toggle file explorer",
			},
		},
		config = function(_, opts)
			require("mini.files").setup(opts)

			local map_split = function(buf_id, lhs, direction)
				local rhs = function()
					local cur_target = MiniFiles.get_explorer_state().target_window
					local new_target = vim.api.nvim_win_call(cur_target, function()
						vim.cmd(direction .. " split")
						return vim.api.nvim_get_current_win()
					end)

					MiniFiles.set_target_window(new_target)

					MiniFiles.go_in({ close_on_file = true })
				end

				local desc = "Split " .. direction
				vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
			end

			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniFilesBufferCreate",
				callback = function(args)
					local buf_id = args.data.buf_id
					map_split(buf_id, "<C-s>", "belowright horizontal")
					map_split(buf_id, "<C-v>", "belowright vertical")
					map_split(buf_id, "<C-t>", "tab")
				end,
			})
		end,
	},
	{
		"nvim-mini/mini.move",
		version = false,
		opts = {
			mappings = {
				down = "<leader>mj",
				up = "<leader>mk",

				line_down = "<leader>mj",
				line_up = "<leader>mk",
			},
		},
	},
	{
		"nvim-mini/mini.splitjoin",
		version = false,
		opts = {},
	},
	{
		"nvim-mini/mini.icons",
		version = false,
		lazy = true,
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return require("nvim-web-devicons")
			end
		end,
		opts = {},
	},
}
