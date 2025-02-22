-- Provides a filesystem browser.
return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			local hostname = require("helpers.hostname")
			local opts = {
				window = {
					position = "float",
				},
			}

			if hostname.home() then
				opts.window.position = "left"
			end

			require("neo-tree").setup(opts)
		end,
	},
}
