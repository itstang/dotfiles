return {
	"rcarriga/nvim-notify",
	opts = {
		render = "default",
		top_down = false,
	},
	config = function(_, opts)
		local notify = require("notify")
		notify.setup(opts)

		vim.notify = function(msg, level, notify_opts)
			return notify(msg, level, notify_opts)
		end
	end,
}
