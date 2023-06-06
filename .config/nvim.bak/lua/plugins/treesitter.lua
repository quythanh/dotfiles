-- highlight, edit, and navigate code
return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"windwp/nvim-ts-autotag", -- autoclose tag
	},
	opts = {
		highlight = { enable = true, use_languagetree = true },
		indent = { enable = true },
		autotag = { enable = true }, -- enable autotagging (w/ nvim-ts-autotag plugin)
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
	},
	config = function(_, opts)
		if type(opts.ensure_installed) == "table" then
			---@type table<string, boolean>
			local added = {}
			opts.ensure_installed = vim.tbl_filter(function(lang)
				if added[lang] then
					return false
				end
				added[lang] = true
				return true
			end, opts.ensure_installed)
		end
		require("nvim-treesitter.configs").setup(opts)
	end,
}
