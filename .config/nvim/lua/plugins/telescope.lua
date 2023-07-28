return {
    "telescope.nvim",
    dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
            require("telescope").load_extension("fzf")
        end,
    },
    opts = {
        defaults = {
            mappings = {
                i = {
                    ["<C-k>"] = require("telescope.actions").move_selection_previous, -- move to prev result
                    ["<C-j>"] = require("telescope.actions").move_selection_next, -- move to next result
                },
            },
        },
    },
}
