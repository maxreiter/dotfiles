return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		config = function()
			local parsers = {
				"bash",
				"caddy",
				"comment",
				"css",
				"csv",
				"desktop",
				"dockerfile",
				"fish",
				"git_config",
				"gitignore",
				"go",
				"gomod",
				"gotmpl",
				"html",
				"ini",
				"jq",
				"json",
				"json5",
				"jsonc",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"passwd",
				"powershell",
				"properties",
				"python",
				"scss",
				"ssh_config",
				"toml",
				"typescript",
				"typst",
				"vimdoc",
				"xml",
				"yaml",
			}

			require("nvim-treesitter").install(parsers)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = parsers,
				callback = function()
					vim.treesitter.start()
					vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
}
