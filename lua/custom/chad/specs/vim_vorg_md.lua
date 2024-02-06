local compat = require("custom.compat")

local M = { "bbrtj/vim-vorg-md" }

M.name = "vim_vorg_md"
M.lazy = true
M.cond = not compat
-- M.dependencies = {}

-- M.init = function()
-- end

-- M.config = function()
-- end

-- M.branch = ""

-- M.event = {}
-- M.cmd = {}
M.ft = { "markdown" }
-- M.keys = {}

-- M.priority = 50

return M
