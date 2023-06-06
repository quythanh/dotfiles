-- This is tabs plugin
return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	opts = {
		options = {
			hover = {
				enabled = true,
				delay = 200,
				reveal = { "close" },
			},
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					separator = true,
				},
			},
			indicator = {
				icon = "",
				style = "icon",
			},
			modified_icon = "●",
			buffer_close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			separator_style = "padded_slop",
			color_icons = true,
			diagnostics = "nvim_lsp",
			diagnostics_update_in_insert = true,
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)
	end,
}
