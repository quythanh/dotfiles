return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "williamboman/mason.nvim" },
	opts = function()
		local nls = require("null-ls")
		local formatting = nls.builtins.formatting -- to setup formatters
		local diagnostics = nls.builtins.diagnostics -- to setup linters
		return {
			root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
			sources = {
				formatting.stylua,
				formatting.prettier,
				diagnostics.flake8,
			},
			-- configure format on save
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("LspFormatting", {}),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									return client.name == "null-ls" -- only use null-ls for formatting instead of lsp server
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		}
	end,
}
