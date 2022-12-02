local M = {}

M.override_options = {
    statusline = {
        separator_style = "arrow", -- default/round/block/arrow
        overriden_modules = function()
            return {
                fileInfo = function() -- Enable laststatus 2 support
                    local icon = "" --  /  / █ / 
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
    }
}

return M

