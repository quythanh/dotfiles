return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 }, -- dependency for better sorting performance
		{ "nvim-telescope/telescope-ui-select.nvim" }, -- for showing lsp code actions
	},
	keys = {
		{
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			desc = "Find files within current working directory, respect .gitignore",
		},
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in current working directory as you type" },
		{
			"<leader>fc",
			"<cmd>Telescope grep_string<cr>",
			desc = "Find string under cursor in current working directory",
		},
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "List open buffers in current neovim instance" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "List available help tags" },
	},
	opts = function()
		local actions = require("telescope.actions")
		local themes = require("telescope.themes")

		return {
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
					},
				},
			},
			extensions = {
				["ui-select"] = {
					themes.get_dropdown({}),
				},
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
				},
			},
		}
	end,
	config = function(_, opts)
		local telescope = require("telescope")

		telescope.setup(opts)

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
	end,
}
