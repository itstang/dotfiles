return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "oxfmt" },
				typescript = { "oxfmt" },
				javascriptreact = { "oxfmt" },
				typescriptreact = { "oxfmt" },
				css = { "oxfmt" },
				html = { "oxfmt" },
				json = { "oxfmt" },
				go = { "goimports" },
				yaml = { "oxfmt" },
				markdown = { "oxfmt" },
				graphql = { "oxfmt" },
				lua = { "stylua" },
				python = { "ruff_organize_imports", "ruff_format" },
				rust = { "rustfmt" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		})

		vim.keymap.set(
			{ "n", "v" },
			"<leader>mp",
			function()
				conform.format({
					lsp_format = "fallback",
					async = false,
					timeout_ms = 500,
				})
			end,
			{ desc = "Format file or range (in visual mode)" }
		)
	end,
}
