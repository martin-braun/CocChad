local M = {}

M.setup = function()
end

M.config = function()
    vim.g.toggle_theme_icon = ""
    local config = require("core.utils").load_config()
    require('auto-dark-mode').setup({ -- override_options
        update_interval = 1000,
        set_light_mode = function()
            local theme = config.ui.theme_toggle[1]
            if config.ui.theme ~= theme then
                vim.g.nvchad_theme = theme
                vim.g.toggle_theme_icon = ""
                config.ui.theme = vim.g.nvchad_theme
                require("nvchad").reload_theme()
            end
        end,
        set_dark_mode = function()
            local theme = config.ui.theme_toggle[2]
            if config.ui.theme ~= theme then
                vim.g.nvchad_theme = theme
                vim.g.toggle_theme_icon = ""
                config.ui.theme = vim.g.nvchad_theme
                require("nvchad").reload_theme()
            end
        end,
    })
    require('auto-dark-mode').init()
end

M.override_options = function() -- setup
    return {}
end

return M

