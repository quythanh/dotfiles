local opt = vim.opt -- for conciseness

local options = {
	relativenumber = true,
	number = true,
	tabstop = 4, -- insert 4 spaces for a tab
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	expandtab = true, -- convert tab to space
	autoindent = true,
	wrap = false,
	ignorecase = true,
	smartcase = true,
	cursorline = true,
	termguicolors = true,
	background = "dark",
	signcolumn = "yes",
	backspace = "indent,eol,start",
	swapfile = false, -- create swap file
}

-- general
opt.clipboard:append("unnamedplus")
opt.iskeyword:append("-")

for k, v in pairs(options) do
	vim.opt[k] = v
end
