return {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
        -- Core package manager – last 1.x commit (May 2 2025)
        { "mason-org/mason.nvim", commit = "4da89f3" }, -- v1.‑series

        -- LSP bridge – latest 1.x release tag (Feb 15 2025)
        { "mason-org/mason-lspconfig.nvim", commit = "1a31f82" }, -- v1.32.0
        -- "mason.nvim",
        -- { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    opts = function()
        ---@class PluginLspOpts
        local ret = {
            -- options for vim.diagnostic.config()
            ---@type vim.diagnostic.Opts
            diagnostics = {
                underline = true,
                update_in_insert = false,
                virtual_text = {
                    spacing = 4,
                    source = "if_many",
                    prefix = "●",
                    -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
                    -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
                    -- prefix = "icons",
                },
                severity_sort = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
                        [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
                        [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
                        [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
                    },
                },
            },
            -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
            -- Be aware that you also will need to properly configure your LSP server to
            -- provide the inlay hints.
            inlay_hints = {
                enabled = true,
                exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
            },
            -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
            -- Be aware that you also will need to properly configure your LSP server to
            -- provide the code lenses.
            codelens = {
                enabled = false,
            },
            -- Enable lsp cursor word highlighting
            document_highlight = {
                enabled = true,
            },
            -- add any global capabilities here
            capabilities = {
                workspace = {
                    fileOperations = {
                        didRename = true,
                        willRename = true,
                    },
                },
            },
            -- options for vim.lsp.buf.format
            -- `bufnr` and `filter` is handled by the LazyVim formatter,
            -- but can be also overridden when specified
            format = {
                formatting_options = nil,
                timeout_ms = nil,
            },
            -- LSP Server Settings
            ---@type lspconfig.options
            servers = {
                jsonls = {},
                lua_ls = {
                    -- mason = false, -- set to false if you don't want this server to be installed with mason
                    settings = {
                        Lua = {
                            workspace = {
                                checkThirdParty = false,
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
                tsserver = {},
                ruff = {
                    cmd = { "ruff", "server", "--preview" },
                    filetypes = { "python" },
                    single_file_support = true,
                    settings = {
                        ruff = {
                            lineLength = 80,
                            nativeServer = true,
                        },
                    },
                    on_attach = function(client, bufnr)
                        if client.name == "ruff" then
                            client.server_capabilities.hoverProvider = false
                        end
                    end,
                },
                pyright = {
                    settings = {
                        pyright = {
                            -- Using Ruff's import organizer
                            disableOrganizeImports = true,
                        },
                        python = {
                            analysis = {
                                -- Ignore all files for analysis to exclusively use Ruff for linting
                                ignore = { "*" },
                            },
                        },
                    },
                },
                rust_analyzer = {},
                -- biome = {
                --     default_config = {
                --         cmd = { "biome", "lsp-proxy" },
                --         filetypes = {
                --             "css",
                --             "javascript",
                --             "javascriptreact",
                --             "json",
                --             "jsonc",
                --             "typescript",
                --             "typescriptreact",
                --         },
                --         root_dir = function(fname)
                --             local root_files = { "biome.json", "biome.jsonc" }
                --             root_files = require("lspconfig.util").insert_package_json(root_files, "biome", fname)
                --             return vim.fs.dirname(vim.fs.find(root_files, { path = fname, upward = true })[1])
                --         end,
                --         single_file_support = false,
                --     },
                --     docs = {
                --         description = [[
                --         https://biomejs.dev
                --
                --         Toolchain of the web. [Successor of Rome](https://biomejs.dev/blog/annoucing-biome).
                --     ]],
                --         default_config = {
                --             root_dir = [[root_pattern('biome.json', 'biome.jsonc')]],
                --         },
                --     },
                -- },
                graphql = {
                    default_config = {
                        filetypes = {
                            "graphql",
                        },
                    },
                },
                -- oxlint = { -- not working
                --     default_config = {
                --         filetypes = {
                --             "javascript",
                --             "javascriptreact",
                --             "typescript",
                --             "typescriptreact",
                --         },
                --     },
                -- },
                -- clangd = {},
            },
            -- you can do any additional lsp server setup here
            -- return true if you don't want this server to be setup with lspconfig
            ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            setup = {
                -- example to setup with typescript.nvim
                -- tsserver = function(_, opts)
                --   require("typescript").setup({ server = opts })
                --   return true
                -- end,
                -- Specify * to use this function as a fallback for any server
                -- ["*"] = function(server, opts) end,

                emmet_ls = function()
                    local capabilities = vim.lsp.protocol.make_client_capabilities()
                    capabilities.textDocument.completion.completionItem.snippetSupport = true
                    require("lspconfig").emmet_ls.setup({
                        mason = false,
                        capabilities = capabilities,
                        filetypes = {
                            "css",
                            "eruby",
                            "html",
                            "javascript",
                            "javascriptreact",
                            "less",
                            "sass",
                            "scss",
                            "svelte",
                            "pug",
                            "typescriptreact",
                            "vue",
                        },
                        init_options = {
                            html = {
                                options = {
                                    -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                                    ["bem.enabled"] = true,
                                },
                            },
                        },
                    })
                    return true
                end,
            },
        }
        return ret
    end,
    ---@param opts PluginLspOpts
    config = function(_, opts)
        -- setup autoformat
        LazyVim.format.register(LazyVim.lsp.formatter())

        -- setup keymaps
        LazyVim.lsp.on_attach(function(client, buffer)
            require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
        end)

        LazyVim.lsp.setup()
        LazyVim.lsp.on_dynamic_capability(require("lazyvim.plugins.lsp.keymaps").on_attach)

        -- diagnostics signs
        if vim.fn.has("nvim-0.10.0") == 0 then
            if type(opts.diagnostics.signs) ~= "boolean" then
                for severity, icon in pairs(opts.diagnostics.signs.text) do
                    local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
                    name = "DiagnosticSign" .. name
                    vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
                end
            end
        end

        if vim.fn.has("nvim-0.10") == 1 then
            -- inlay hints
            if opts.inlay_hints.enabled then
                LazyVim.lsp.on_supports_method("textDocument/inlayHint", function(client, buffer)
                    if
                        vim.api.nvim_buf_is_valid(buffer)
                        and vim.bo[buffer].buftype == ""
                        and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buffer].filetype)
                    then
                        vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
                    end
                end)
            end

            -- code lens
            if opts.codelens.enabled and vim.lsp.codelens then
                LazyVim.lsp.on_supports_method("textDocument/codeLens", function(client, buffer)
                    vim.lsp.codelens.refresh()
                    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
                        buffer = buffer,
                        callback = vim.lsp.codelens.refresh,
                    })
                end)
            end
        end

        if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
            opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
                or function(diagnostic)
                    local icons = LazyVim.config.icons.diagnostics
                    for d, icon in pairs(icons) do
                        if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
                            return icon
                        end
                    end
                end
        end

        vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

        local servers = opts.servers
        local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
        local has_blink, blink = pcall(require, "blink.cmp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            has_cmp and cmp_nvim_lsp.default_capabilities() or {},
            has_blink and blink.get_lsp_capabilities() or {},
            opts.capabilities or {}
        )

        local function setup(server)
            local server_opts = vim.tbl_deep_extend("force", {
                capabilities = vim.deepcopy(capabilities),
            }, servers[server] or {})
            if server_opts.enabled == false then
                return
            end

            if opts.setup[server] then
                if opts.setup[server](server, server_opts) then
                    return
                end
            elseif opts.setup["*"] then
                if opts.setup["*"](server, server_opts) then
                    return
                end
            end
            require("lspconfig")[server].setup(server_opts)
        end

        -- get all the servers that are available through mason-lspconfig
        local have_mason, mlsp = pcall(require, "mason-lspconfig")
        local all_mslp_servers = {}
        if have_mason then
            all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
        end

        local ensure_installed = {} ---@type string[]
        for server, server_opts in pairs(servers) do
            if server_opts then
                server_opts = server_opts == true and {} or server_opts
                if server_opts.enabled ~= false then
                    -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
                    if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
                        setup(server)
                    else
                        ensure_installed[#ensure_installed + 1] = server
                    end
                end
            end
        end

        if have_mason then
            mlsp.setup({
                ensure_installed = vim.tbl_deep_extend(
                    "force",
                    ensure_installed,
                    LazyVim.opts("mason-lspconfig.nvim").ensure_installed or {}
                ),
                handlers = { setup },
            })
        end

        if LazyVim.lsp.is_enabled("denols") and LazyVim.lsp.is_enabled("vtsls") then
            local is_deno = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
            LazyVim.lsp.disable("vtsls", is_deno)
            LazyVim.lsp.disable("denols", function(root_dir, config)
                if not is_deno(root_dir) then
                    config.settings.deno.enable = false
                end
                return false
            end)
        end
    end,
}
