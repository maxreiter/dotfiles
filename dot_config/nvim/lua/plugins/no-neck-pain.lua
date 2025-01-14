-- Provides an unopinionated zen mode.
return {
	{
		"shortcuts/no-neck-pain.nvim",
		version = "*",
		opts = {
			width = 175,
			autocmds = {
				enableOnVimEnter = true,
			},
			buffers = {
				right = {
					scratchpad = {
						enabled = true,
						pathToFile = "~/.notes.md",
					},
				},
			},
		},
	},
}
