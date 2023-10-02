local compat = require("custom.compat")

local M = { "RaafatTurki/hex.nvim" }

M.name = "hex_nvim"
M.lazy = true
M.cond = not compat
-- M.dependencies = {}

M.init = function()
end

M.config = function()
    require('hex').setup()
end

M.main = "hex"

-- M.branch = ""

-- M.event = {}
-- M.cmd = {}
-- M.ft = {}
M.keys = {
    { "<leader>v", mode = 'n' },
}

-- M.priority = 50

return M
