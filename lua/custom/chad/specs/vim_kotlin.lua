local compat = require("custom.compat")

local M = { "udalov/kotlin-vim" }

M.name = "vim_kotlin"
M.lazy = true
M.cond = not compat
-- M.dependencies = {}

M.init = function()
end

M.config = function()
end

-- M.branch = ""

-- M.event = {}
-- M.cmd = {}
M.ft = { "kotlin" }
-- M.keys = {}

-- M.priority = 50

return M

