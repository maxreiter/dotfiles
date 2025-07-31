-- Use 4 characters per indentation
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Disable line numbers in left gutter
vim.opt.number = true

-- Enable mouse support for all modes ("a" flag)
vim.opt.mouse = "a"

-- Disable the display of mode in the status line
vim.opt.showmode = false

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable breakindent; wrapped lines start at the same indentation
vim.opt.breakindent = true

-- Write undo information to disk
vim.opt.undofile = true

-- Enable case-insensitive search; disable with '\C' or a capital letter
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Always display sign column
vim.opt.signcolumn = "yes"

-- Decrease the update time; number of ms between writes to the swap file
-- when input has not been received
vim.opt.updatetime = 250

-- Configure split defaults
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Display characters for type of whitespace
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Enable cursor line; highlights the line the cursor is on
vim.opt.cursorline = true

-- Minimum number of lines to keep above and below cursor
vim.opt.scrolloff = 10
