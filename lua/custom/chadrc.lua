local M = {}

M.ui = {
    theme_toggle = { "one_light", "onedark" },
    theme = "onedark",
}

M.mappings = require("custom.chad.mappings")
M.plugins = require("custom.chad.plugins")

return M

