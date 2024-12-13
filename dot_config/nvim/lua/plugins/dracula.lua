-- Adds the dracula colorscheme.
return {
	{
		"maxmx03/dracula.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local dracula = require("dracula")

			dracula.setup({
				styles = {
					Type = {},
					Function = {},
					Parameter = {},
					Property = {},
					Comment = {},
					String = {},
					Keyword = {},
					Identifier = {},
					Constant = {},
				},
				transparent = false,
				plugins = {
					["nvim-treesitter"] = true,
					["nvim-cmp"] = true,
					["gitsigns.nvim"] = true,
					["lazy.nvim"] = true,
				},
			})
		end,
	},
}
