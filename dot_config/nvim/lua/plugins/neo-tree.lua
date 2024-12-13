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
			local hostname = require("helpers/hostname")
			local position = "left"

			if hostname.work() then
				position = "bottom"
			end

			require("neo-tree").setup({
				window = {
					position = position,
				},
			})
		end,
	},
}
