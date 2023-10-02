local compat = require("custom.compat")

local M = { "nvim-treesitter/nvim-treesitter-context" }

M.name = "nvim_treesitter_context"
M.lazy = false
M.cond = not compat
-- M.dependencies = {}

M.init = function()
end

M.config = function()
end

-- M.branch = ""

-- M.event = {}
-- M.cmd = {}
-- M.ft = {}
-- M.keys = {}

M.priority = 50

return M
