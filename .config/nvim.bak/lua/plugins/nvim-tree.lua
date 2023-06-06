-- This is file explorer plugin
return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<M-e>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
	},
	opts = {
		renderer = {
			icons = {
				glyphs = {
					folder = {
						arrow_closed = "", -- arrow when folder is closed
						arrow_open = "", -- arrow when folder is open
					},
				},
			},
		},
	},
	config = function(_, opts)
		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- change color for arrows in tree to light blue
		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

		require("nvim-tree").setup(opts)
	end,
}
