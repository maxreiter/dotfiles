-- Switch to using 4 spaces per tab key.
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Enable colorscheme support in tmux.
vim.opt.termguicolors = true

-- Enable line numbers
vim.opt.number = true

-- Enable mouse using "a" flag.
vim.opt.mouse = "a"

-- Disable displaying mode in status line.
vim.opt.showmode = false

-- Sync clipboard
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent.
vim.opt.breakindent = true

-- Save undo information in a file.
vim.opt.undofile = true

-- Enable case-insensitive searching unless \C or one or more capital letters is in the search.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable the sign column.
vim.opt.signcolumn = "yes"

-- Decrease update time.
-- The # of MS without input that the swap file is saved.
vim.opt.updatetime = 250

-- Configure split options.
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Configure display of whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Enable cursor line.
vim.opt.cursorline = true

-- Configure scrolloff
-- Minimum # of lines to keep above & below cursor.
vim.opt.scrolloff = 10
