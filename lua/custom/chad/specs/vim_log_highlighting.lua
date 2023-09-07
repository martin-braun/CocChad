local compat = require("custom.compat")

local M = { "MTDL9/vim-log-highlighting" }

M.name = "vim_log_highlighting"
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
M.ft = { "log" }
-- M.keys = {}

-- M.priority = 50

return M

