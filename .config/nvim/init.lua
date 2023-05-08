require("neovide")
require("core.options")
require("core.keymaps")
require("core.colorscheme")
require("plugins")
require("plugins.nvim-tree")
require("plugins.lualine")
require("plugins.telescope")
require("plugins.nvim-cmp")
require("plugins.treesitter")
require("plugins.autopairs")
require("plugins.gitsigns")
require("plugins.indent-blankline")
require("plugins.bufferline")
require("plugins.lsp.mason")
require("plugins.lsp.mason-lspconfig")
require("plugins.lsp.null-ls")
vim.cmd("colorscheme onedark")
vim.cmd("source ~/.config/nvim/lua/core/term.vim")
