return {
	{
		"stevearc/conform.nvim",
		opts = {
			log_level = vim.log.levels.DEBUG,
			notify_on_error = true,
			notify_no_formatters = true,
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500
			},
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "gofmt" }
			}
		}
	}
}
