-- Enables LuaLS for editing the neovim config.
return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{
					path = "luvit-meta/library",
					words = { "vim%.uv" },
				}
			},
		},
	},
}
