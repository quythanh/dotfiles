return {
	-- configuring lsp servers
	{
		"neovim/nvim-lspconfig", -- easily configure language servers
		dependencies = {
			"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
			"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
			"j-hui/fidget.nvim", -- status update for lsp
		},
	},

	{ "nvim-lua/plenary.nvim" }, -- lua functions that many plugins use

	-- essential plugins
	{ "tpope/vim-surround" },

	-- icons
	{ "nvim-tree/nvim-web-devicons" },

	-- autocompletion, snippets
	{ "jose-elias-alvarez/typescript.nvim" }, -- additional functionality for typescript server (e.g. rename file & update imports )

	-- formatting & linting
	{ "jose-elias-alvarez/null-ls.nvim" }, -- configure formatters & linters
	{ "jayp0521/mason-null-ls.nvim" }, -- bridges gap b/w mason & null-ls

	-- syntax highlight
	{ "jackguo380/vim-lsp-cxx-highlight" }, -- C++

	-- emmet
	{ "mattn/emmet-vim" },

	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
}
