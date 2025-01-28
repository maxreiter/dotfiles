-- Provides an unopinionated zen mode.
return {
	{
		"shortcuts/no-neck-pain.nvim",
		version = "*",
		config = function()
			local hostname = require("helpers.hostname")
			local enable = true

			if hostname.home() then
				enable = false
			end

			require("no-neck-pain").setup({
				width = 175,
				autocmds = {
					enableOnVimEnter = enable,
				},
				buffers = {
					right = {
						scratchpad = {
							enabled = true,
							pathToFile = "~/.notes.md",
						},
					},
				},
			})
		end,
	},
}
