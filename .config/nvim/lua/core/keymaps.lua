vim.g.mapleader = " "

local map = vim.keymap.set -- for conciseness
local options = { silent = true } -- hide the command in status bar

-- general
map("i", "jk", "<ESC>")

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", options)

-- float terminal
map("n", "<leader>t", ":call OpenFloatTerm()<CR>", options)

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
