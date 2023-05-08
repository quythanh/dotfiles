local lspconfig = require("lspconfig")
local map = vim.keymap.set

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
	map("n", "gD", vim.lsp.buf.declaration, opts) -- got to declaration
	map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- see definition and make edits in window
	map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- go to implementation
	map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- go to implementation
	map("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions
	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
	map("n", "<leader>rn", ":IncRename ", opts) -- smart rename
	map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show    diagnostics for file
	map("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
	map("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
	map("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
	map("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		map("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		map("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		map("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end
end

local default_language_setup = {
	capabilities = require("cmp_nvim_lsp").default_capabilities(), -- used to enable autocompletion (assign to every lsp server config)
	on_attach = on_attach,
}

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure typescript server with plugin
require("typescript").setup({
	server = default_language_setup,
})

lspconfig.cssmodules_ls.setup(default_language_setup)
-- lspconfig.emmet_ls.setup(default_language_setup)
lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.clangd.setup({})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
})

-- rust
lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "rust" },
	root_dir = lspconfig.util.root_pattern("Cargo.toml"),
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
		},
	},
})
