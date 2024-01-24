return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = function()
        return {
            {
                "<M-e>",
                function()
                    require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").root.get() })
                end,
                desc = "Explorer NeoTree (root dir)",
            },
            {
                "<M-E>",
                function()
                    require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
                end,
                desc = "Explorer NeoTree (cwd)",
            },
        }
    end,
    opts = {
        filesystem = {
            window = {
                mappings = {
                    ["o"] = {
                        command = "open",
                        nowait = true,
                    },
                    ["O"] = {
                        command = "open",
                        nowait = true,
                    },
                },
            },
        },
        default_component_configs = {
            symbols = {
                -- Change type
                added = "✚",
                deleted = "✖",
                modified = "",
                renamed = "",
                -- Status type
                untracked = "",
                ignored = "",
                unstaged = "",
                staged = "",
                conflict = "",
            },
        },
    },
}
