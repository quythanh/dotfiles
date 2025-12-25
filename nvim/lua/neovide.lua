if vim.g.neovide then
    vim.g.neovide_opacity = 0.8
    vim.g.neovide_normal_opacity = 0.8
    vim.g.neovide_hide_mouse_when_typing = false
    vim.g.neovide_refresh_rate = 144
    vim.g.neovide_refresh_rate_idle = 5
    vim.g.neovide_fullscreen = true
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
    vim.g.neovide_scale_factor = 0.85
    vim.o.guifont = "JetBrainsMono Nerd Font:h14"

    local function set_ime(args)
        if args.event:match("Enter$") then
            vim.g.neovide_input_ime = true
        else
            vim.g.neovide_input_ime = false
        end
    end

    local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

    vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
        group = ime_input,
        pattern = "*",
        callback = set_ime,
    })

    vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
        group = ime_input,
        pattern = "[/\\?]",
        callback = set_ime,
    })
end
