return {
	{ "nvim-lua/plenary.nvim", lazy = true }, -- lua functions that many plugins use

	{ "tpope/vim-surround", event = "BufReadPre" }, -- change the surround () "" '' ...

	-- autocompletion, snippets
	{
		"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports )
	},

	-- formatting & linting
	{ "jose-elias-alvarez/null-ls.nvim" }, -- configure formatters & linters
	{ "jayp0521/mason-null-ls.nvim" }, -- bridges gap b/w mason & null-ls

	-- syntax highlight
	{ "jackguo380/vim-lsp-cxx-highlight", ft = "cpp" }, -- C++

	-- html emmet
	{ "mattn/emmet-vim", ft = "html" },

	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
}
