return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        dashboard = {
            sections = {
                {
                    section = "terminal",
                    cmd = "chafa /home/quythanh/.config/.resources/images/Kurumi_logo.png --format symbols --size 55x20 --stretch",
                    height = 17,
                    padding = 1,
                },
                {
                    pane = 2,
                    { section = "keys", gap = 1, padding = 1 },
                    { section = "startup" },
                },
            },
        },
    },
    keys = {
        {
            "<leader>gl",
            function()
                require("snacks").lazygit.log()
            end,
            desc = "Lazygit log",
        },
    },
}
