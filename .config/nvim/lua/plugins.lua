local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

if packer_bootstrap then
	print("===================================")
	print("    Plugins are being installed")
	print("    Wait until Packer completes")
	print("    Then restart nvim")
	print("===================================")
end

-- add list of plugins to install
return require("packer").startup(function(use)
	-- add list of plugins to install
	use("wbthomason/packer.nvim") -- package manager

	-- configuring lsp servers
	use({
		"neovim/nvim-lspconfig", -- easily configure language servers
		requires = {
			"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
			"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
			"j-hui/fidget.nvim", -- status update for lsp
		},
	})

	use("joshdick/onedark.vim") -- theme
	use("lukas-reineke/indent-blankline.nvim") -- indent line
	use("nvim-tree/nvim-tree.lua") -- file explorer
	use("nvim-lualine/lualine.nvim") -- status bar
	use("akinsho/bufferline.nvim") -- tabs

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	-- essential plugins
	use("tpope/vim-surround")

	-- icons
	use("nvim-tree/nvim-web-devicons")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
	use({ "nvim-telescope/telescope-ui-select.nvim" }) -- for showing lsp code actions

	-- autocompletion, snippets
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- treesitter
	use({ -- highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- wakatime
	use("wakatime/vim-wakatime")

	-- syntax highlight
	use("jackguo380/vim-lsp-cxx-highlight") -- C++

	-- emmet
	use("mattn/emmet-vim")

	use({
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
