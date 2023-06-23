-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- general
map("i", "jk", "<ESC>")

-- double line
map("n", "<C-M-j>", "Vyp")
map("i", "<C-M-j>", "<ESC>Vypi")

-- close tab
map("n", "<M-w>", ":bd<cr>")
map("n", "<M-n>", ":bn<cr>")
map("n", "<M-p>", ":bp<cr>")
