return {
	"navarasu/onedark.nvim", -- theme
	opts = {
		style = "cool",
	},
	config = function(_, opts)
		local theme = require("onedark")
		theme.setup(opts)
		theme.load()
	end,
}
