local compat = require("custom.compat")

local M = { "Exafunction/codeium.vim" }

M.name = "codeium_vim"
M.lazy = true
M.cond = not compat
-- M.dependencies = {}

M.init = function()
end

M.config = function()
end

-- M.branch = ""

M.event = { "InsertEnter" }
-- M.cmd = {}
-- M.ft = {}
-- M.keys = {}

-- M.priority = 0

return M
