-- This is auto closing plugin
return {
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	event = "BufReadPre",
	opts = {
		check_ts = true, -- enable treesitter
		ts_config = {
			lua = { "string" }, -- don't add pairs in lua string treesitter nodes
			javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
			java = false, -- don't check treesitter on java
		},
	},
	config = function(_, opts)
		require("nvim-autopairs").setup(opts)
		-- make autopairs and completion work together
		require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
	end,
}
