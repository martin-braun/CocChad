local M = {}

M.ui = {
    theme_toggle = { "one_light", "onedark" },
    theme = "one_light",
    statusline = {
        separator_style = "round", -- default/round/block/arrow
        overriden_modules = function()
            return {
                fileInfo = function() -- Enable laststatus 2 support
                    local icon = "" --  /  / █ / 
                    local filename = (vim.fn.expand "%" == "" and " Empty") or " %t "
                    return "%#St_file_info#" .. filename .. "%#St_file_sep#" .. icon .. " "
                end,
            }
        end,
    },
    tabufline = {
        overriden_modules = function()
            return {
                buttons = function() -- hide buttons
                    return ""
                end,
            }
        end,
    },
    hl_add = {
        NvimTreeOpenedFolderName = { fg = "green", bold = true },
    },
    hl_override = {
        -- Comment = {
        -- italic = true,
        -- },
    },
}

M.plugins = "custom.chad.plugins"
M.mappings = require("custom.chad.mappings")

return M

