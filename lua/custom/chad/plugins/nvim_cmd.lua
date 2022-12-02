local M = {}

M.override_options = function()
    local cmp = require("cmp")
    return {
        mapping = {
            ["<C-p>"] = {},
            ["<Up>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = {},
            ["<Down>"] = cmp.mapping.select_next_item(),
        }
    }
end

return M

