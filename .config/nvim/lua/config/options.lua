-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

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
    clipboard = {
        name = "xclip-custom",
        copy = {
            ["+"] = "xclip -quiet -i -selection clipboard",
            ["*"] = "xclip -quiet -i -selection clipboard",
        },
        paste = {
            ["+"] = "xclip -o -selection clipboard",
            ["*"] = "xclip -o -selection primary",
        },
    },
    mousemoveevent = true,
}

-- general
opt.iskeyword:append("-")

for k, v in pairs(options) do
    opt[k] = v
end
