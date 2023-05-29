local M = { "theHamsta/nvim-dap-virtual-text" }

M.name = "nvim_dap_virtual_text"
M.lazy = true
M.dependencies = { "nvim_dap" }

M.init = function()
end

M.config = function()
    require("nvim-dap-virtual-text").setup({})
end

-- M.branch = ""

-- M.event = {}
-- M.cmd = {}
-- M.ft = {}
M.keys = { "<leader>d" }

-- M.priority = 50

return M
