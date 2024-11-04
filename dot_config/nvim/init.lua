-------------
-- OPTIONS --
-------------

-- GLOBAL

-- Set leader key to space.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- LOCAL

-- Switch to using 4 spaces per tab key.
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Enable colorscheme support in tmux.
vim.opt.termguicolors = true

-- Enable line numbers
vim.opt.number = true

-- Enable mouse with "a" flag.
vim.opt.mouse = "a"

-- Disable showing mode in status line.
vim.opt.showmode = false

-- Enable syncing of clipboard.
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent.
vim.opt.breakindent = true

-- Save undo information in a file.
vim.opt.undofile = true

-- Enable case-insensitive searching unless \C or one or more capital letters in search.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable the sign column.
vim.opt.signcolumn = "yes"

-- Decrease the update time.
-- The # of MS without input that the swap file is saved.
vim.opt.updatetime = 250

-- Configure split options.
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Configure display of whitespace characters.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Enable cursor line.
vim.opt.cursorline = true

-- Configure scrolloff.
-- Minimum # of lines to keep above & below cursor.
vim.opt.scrolloff = 10

--------------
-- BINDINGS --
--------------

-- Clear highlights on search terms.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

--------------
-- AUTOCMDS --
--------------

-- Highlight when yanking text.
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text.",
	group = vim.api.nvim_create_augroup("max-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-------------
-- PLUGINS --
-------------

-- Install lazy.nvim.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Set up lazy.nvim & install plugins.
require("lazy").setup({
	-- Automatically adjust shiftwidth and expandtab based on file type & files in adjacent directories.
	"tpope/vim-sleuth",

	{
		-- Adds git symbol support to buffers
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	{
		-- Sets up LuaLS for editing the neovim config.
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{
					path = "luvit-meta/library",
					words = { "vim%.uv" },
				},
			},
		},
	},

	{
		-- Provides type definitions for the Luvit framework.
		"Bilal2453/luvit-meta",
		lazy = true,
	},

	{
		-- Provides configuration for neovim's LSP clients.
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			{ "j-hui/fidget.nvim",       opts = {} },

			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("max-lsp-attach", { clear = true }),
				callback = function(event)
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup = vim.api.nvim_create_augroup("max-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("max-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds { group = "max-lsp-highlight", buffer = event2.buf }
							end,
						})
					end
				end
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local servers = {
				gopls = {},
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				},
			}

			require("mason").setup()

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua",
			})
			require("mason-tool-installer").setup { ensure_installed = ensure_installed }

			require("mason-lspconfig").setup {
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}

						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			}
		end,
	},

	{
		-- Provides a configurable formatter.
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = true,
			notify_no_formatters = true,
			formatters_by_ft = {
				lua = { "stylua " },
				go = { "goimports", "gofmt" },
			},
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				local lsp_format_opt
				if disable_filetypes[vim.bo[bufnr].filetype] then
					lsp_format_opt = "never"
				else
					lsp_format_opt = "fallback"
				end
				return {
					timeout_ms = 500,
					lsp_format = lsp_format_opt,
				}
			end
		},
	},

	{
		-- Provides a completion engine.
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),

					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),

					["<C-y>"] = cmp.mapping.confirm({ select = true }),

					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),

					["<C-Space>"] = cmp.mapping.complete({}),
				}),
				sources = {
					{
						name = "lazydev",
						group_index = 0,
					},
					{
						name = "nvim_lsp",
					},
					{
						name = "luasnip",
					},
					{
						name = "path",
					},
				},
			})
		end,
	},

	{
		-- Provides dracula colorscheme
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
					["nvim-tree.lua"] = true,
					["gitsigns.nvim"] = true,
					["lazy.nvim"] = true
				},
			})

			vim.cmd.colorscheme("dracula")
			vim.cmd.colorscheme("dracula-soft")
		end,
	},

	{
		-- Provides a status line in Lua.
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				theme = vim.g.colors_name,
				refresh = {
					statusline = 1000,
				},
			},
		},
	},

	{
		-- Provides a file explorer.
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},

	{
		-- Provides TODO highlights.
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			signs = false,
		},
	},

	{
		-- Provides confiurations & abstractons for treesitter.
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

	{
		-- Provides support for Go
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()',
	},
})
