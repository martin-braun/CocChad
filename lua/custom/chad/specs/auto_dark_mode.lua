local M = { "f-person/auto-dark-mode.nvim" }

M.name = "auto_dark_mode"
M.lazy = false
-- M.dependencies = {}

M.init = function()
end

M.config = function()
    vim.g.toggle_theme_icon = ""
    local config = require("core.utils").load_config()
    local auto_dark_mode = require('auto-dark-mode')
    auto_dark_mode.setup({
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
    auto_dark_mode.init()
end

-- M.branch = ""

-- M.event = {}
-- M.cmd = {}
-- M.ft = {}
-- M.keys = {}

M.priority = 1000

return M

