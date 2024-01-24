local compat = require("custom.compat")

local M = {}

M.plugins = "custom.chad.plugins"

if compat == "vscode" then
    M.mappings = require("custom.chad.compat.vscode.mappings")
elseif compat == "firenvim" then
    M.mappings = require("custom.chad.compat.firenvim.mappings")
else
    M.mappings = require("custom.chad.mappings")

    M.ui = {
        -- transparency = true,
        theme_toggle = { "one_light", "onedark" },
        theme = "onedark",
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
            overriden_modules = function(modules)
              table.remove(modules, 4)
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

end

return M
