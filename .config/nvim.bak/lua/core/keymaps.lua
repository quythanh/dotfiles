vim.g.mapleader = " "

local map = vim.keymap.set -- for conciseness
local options = { silent = true } -- hide the command in status bar

-- general
map("i", "jk", "<ESC>")

-- double line
map("n", "<C-d>", "Vyp")
map("i", "<C-d>", "<ESC>Vypi")

-- close tab
map("n", "<M-w>", ":bd<cr>")
map("n", "<M-n>", ":bn<cr>")
map("n", "<M-p>", ":bp<cr>")
