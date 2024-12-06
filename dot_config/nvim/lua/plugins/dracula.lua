-- Adds the dracula colorscheme.
return {
	{
		"maxmx03/dracula.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local dracula = require("dracula")

			dracula.setup({
				transparent = false,
				plugins = {
					["nvim-treesitter"] = true,
					["nvim-cmp"] = true,
					["gitsigns.nvim"] = true,
					["lazy.nvim"] = true,
				},
			})

			vim.cmd.colorscheme("dracula")
			vim.cmd.colorscheme("dracula-soft")
		end
	},
}
