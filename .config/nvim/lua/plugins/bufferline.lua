-- This is tabs plugin
return {
    "akinsho/bufferline.nvim",
    opts = {
        options = {
            always_show_bufferline = true,
            hover = {
                enabled = true,
                delay = 120,
                reveal = { "close" },
            },
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "File Explorer",
                    highlight = "Directory",
                    separator = true,
                    text_align = "center",
                },
            },
            indicator = {
                icon = "▎",
                style = "underline",
            },
            modified_icon = "●",
            buffer_close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            separator_style = "slant",
            color_icons = true,
            diagnostics = "nvim_lsp",
            diagnostics_update_in_insert = true,
        },
    },
}
