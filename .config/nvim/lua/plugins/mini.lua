return {
    {
        "echasnovski/mini.ai",
        event = function()
            return { "BufReadPre", "BufNewFile" }
        end,
    },
    {
        "echasnovski/mini.comment",
        event = function()
            return { "BufReadPre", "BufNewFile" }
        end,
    },
    {
        "echasnovski/mini.pairs",
        event = function()
            return { "BufReadPre", "BufNewFile" }
        end,
    },
}
