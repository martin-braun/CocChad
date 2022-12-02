local M = {}

M.override_options = function()
    return {
        open_on_setup = true,
        view = {
            adaptive_size = true,
            mappings = {
                list = {
                    { key = "+", action = "cd" }, -- move down with +, because move up is triggered by -
                    { key = "<C-e>", action = nil } -- undo edit in place
                }
            }
        },
        renderer = {
            symlink_destination = false,
        },
    }
end

return M

