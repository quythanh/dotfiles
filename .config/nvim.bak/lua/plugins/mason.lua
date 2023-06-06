return {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    },
}

--require("mason-lspconfig").setup({
--	-- list of servers for mason to install
--	-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
--	ensure_installed = {
--		"tsserver", -- javascript / typescript
--		"emmet_ls", -- emmet
--		"clangd", -- c/c++
--		"jdtls", -- java
--		"rust_analyzer", -- rust
--		"pyright", -- python
--	},
--	-- auto-install configured servers (with lspconfig)
--	automatic_installation = true, -- not the same as ensure_installed
--})
--
--require("mason-null-ls").setup({
--	-- list of formatters & linters for mason to install
--	ensure_installed = {
--		"prettier", -- ts/js formatter
--		"stylua", -- lua formatter
--        "flake8",
--	},
--	-- auto-install configured formatters & linters (with null-ls)
--	automatic_installation = true,
--})
