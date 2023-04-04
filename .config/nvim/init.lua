require("plugins-setup")
require("core.options")
require("core.keymaps")
require("core.colorscheme")
require("plugins.nvim-tree")
require("plugins.lualine")
require("plugins.telescope")
require("plugins.nvim-cmp")
require("plugins.lsp.mason")
require("plugins.lsp.lspconfig")
require("plugins.lsp.null-ls")
require("plugins.treesitter")
require("plugins.autopairs")
require("plugins.gitsigns")
require("plugins.indent-blankline")
require("plugins.bufferline")
vim.cmd("colorscheme onedark")
vim.cmd("source ~/.config/nvim/lua/core/term.vim")