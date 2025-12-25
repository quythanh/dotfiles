-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

local options = {
    relativenumber = true,
    number = true,
    tabstop = 2, -- insert 2 spaces for a tab
    shiftwidth = 2, -- the number of spaces inserted for each indentation
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
    clipboard = "unnamedplus",
    mousemoveevent = true,
}

-- general
opt.iskeyword:append("-")

for k, v in pairs(options) do
    opt[k] = v
end

vim.o.guifont = "JetBrainsMono Nerd Font:h10"
