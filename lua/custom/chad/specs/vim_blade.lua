local compat = require("custom.compat")

local M = { "jwalton512/vim-blade" }

M.name = "vim_blade"
M.lazy = true
M.cond = not compat
-- M.dependencies = {}

M.init = function()
end

M.config = function()
    -- vim.g.blade_custom_directives =
    -- vim.g.blade_custom_directives_pairs =
end

-- M.branch = ""

-- M.event = {}
-- M.cmd = {}
M.ft = { "blade" }
-- M.keys = {}

-- M.priority = 50

return M

