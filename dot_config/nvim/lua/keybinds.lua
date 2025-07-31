-- Clear highlighted search terms
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>")

-- Toggle neotree
vim.keymap.set("n", "<Bar>", "<Cmd>Neotree toggle<CR>")

-- Format buffer with conform
vim.keymap.set("n", "<C-F>", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end)
