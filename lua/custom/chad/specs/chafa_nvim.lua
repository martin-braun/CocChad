local compat = require("custom.compat")

local M = { "princejoogie/chafa.nvim" }

M.name = "chafa_nvim"
M.lazy = true
M.cond = not compat
M.dependencies = { "nvim-lua/plenary.nvim", "m00qek/baleia.nvim" }

M.init = function()
end

M.config = function()
    require("chafa").setup({
        render = {
            min_padding = 4,
            show_label = false,
        },
        events = {
            update_on_nvim_resize = true,
        },
    })
end

-- M.branch = ""

-- M.event = {}
-- M.cmd = {}
-- M.ft = {}
M.keys = {
    { "<leader>v", mode = 'n' },
}

-- M.priority = 100

return M
