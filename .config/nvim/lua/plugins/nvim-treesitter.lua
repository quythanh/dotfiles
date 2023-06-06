return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    opts = {
        rainbow = {
            enable = true,
            query = "rainbow-parens",
            strategy = require("ts-rainbow").strategy.global,
        },
        autotag = {
            enable = true,
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
