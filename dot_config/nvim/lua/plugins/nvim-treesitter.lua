-- Provides configurations and abstractions for treesitter.
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			ensure_installed = {
				"bash",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
				"go",
				"gomod",
				"gosum",
				"javascript",
				"json",
				"json5",
				"jq",
				"css",
				"scss",
				"dockerfile",
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		},
	},
}
