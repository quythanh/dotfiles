-- This is floating terminal
return {
	"numToStr/FTerm.nvim",
	keys = {
		{ "<M-t>", "<cmd>FTermToggle<cr>", desc = "Toggle Terminal", mode = { "n", "t" } },
	},
	config = function()
		vim.api.nvim_create_user_command("FTermToggle", require("FTerm").toggle, { bang = true })
	end,
}
