-- Clear highlights on search terms.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Toggle Neotree.
vim.keymap.set("n", "<Bar>", "<Cmd>Neotree toggle<CR>")

-- Toggle floating diagnostics.
vim.keymap.set("n", '"', function()
	vim.diagnostic.open_float()
end)
