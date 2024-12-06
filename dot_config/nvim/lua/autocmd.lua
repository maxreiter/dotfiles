-- Highlight when yanking text.
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when tanking text.",
	group = vim.api.nvim_create_augroup("max-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
