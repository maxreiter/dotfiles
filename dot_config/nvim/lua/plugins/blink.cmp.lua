return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		version = "1.*",
		opts = {
			keymap = { preset = "enter" },
			signature = { enabled = true },
			sources = {
				default = { "lsp", "path", "buffer" },
			},
		},
		opts_extend = { "sources.default" },
	},
}
