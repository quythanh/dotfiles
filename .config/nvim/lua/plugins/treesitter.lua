-- highlight, edit, and navigate code
return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag", -- autoclose tag
	},
	build = function()
		pcall(require("nvim-treesitter.install").update({ with_sync = true }))
	end,
	opts = {
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		-- enable indentation
		indent = { enable = true },
		-- enable autotagging (w/ nvim-ts-autotag plugin)
		autotag = { enable = true },
		-- ensure these language parsers are installed
		ensure_installed = {
			"json",
			"javascript",
			"typescript",
			"tsx",
			"yaml",
			"css",
			"scss",
			"markdown",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"cpp",
			"go",
			"python",
			"java",
			"sql",
			"rust",
		},
		-- auto install above language parsers
		auto_install = true,
	},
}
