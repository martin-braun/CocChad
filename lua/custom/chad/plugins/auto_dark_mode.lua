local M = {}

M.config = function()

    vim.g.toggle_theme_icon = ""
    local config = require("core.utils").load_config()
    require('auto-dark-mode').setup({
        update_interval = 1000,
        set_light_mode = function()
            if config.ui.theme ~= config.ui.theme_toggle[1] then
                require("base46").toggle_theme()
                vim.g.toggle_theme_icon = ""
                config.ui.theme = vim.g.nvchad_theme
            end
        end,
        set_dark_mode = function()
            if config.ui.theme ~= config.ui.theme_toggle[2] then
                require("base46").toggle_theme()
                vim.g.toggle_theme_icon = ""
                config.ui.theme = vim.g.nvchad_theme
            end
        end,
    })
    require('auto-dark-mode').init()

end

return M

