local compat = require("custom.compat")

local M = { "glacambre/firenvim" }

M.name = "firenvim"
M.lazy = compat ~= "firenvim"
-- M.dependencies = {}

M.config = function()
    vim.g.firenvim_config = {
        localSettings = {
            [".*"] = {
                cmdline = "vim",
                takeover = "never",
            },
        }
    }
    -- start in append mode:
    vim.cmd("set guifont=:h22")
    vim.cmd("call cursor(0, col('.') + 1)")
    vim.cmd("startinsert")
end

-- M.branch = ""

M.keys = {
    { "<leader>cfn", mode = 'n' },
}

M.priority = 1000

return M

