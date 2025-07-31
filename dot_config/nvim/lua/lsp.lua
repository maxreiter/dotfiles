vim.lsp.enable("gopls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("dprint")
vim.lsp.enable("tinymist")

vim.lsp.config("dprint", {
	filetypes = { "html", "scss", "json", "jsonc" },
})

vim.lsp.config("tinymist", {
	filetypes = { "typ", "typst" },
})
