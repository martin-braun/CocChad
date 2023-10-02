local compat = require("custom.compat")

local M = { "stevearc/vim-arduino" }

M.name = "vim_arduino"
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
-- M.ft = {}
M.keys = { "<leader>a" }

-- M.priority = 50

return M
