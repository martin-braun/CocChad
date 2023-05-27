local M = { "nvim-telescope/telescope-dap.nvim" }

M.name = "telescope_dap_nvim"
M.lazy = false
M.dependencies = { "nvim_dap", "nvim-telescope/telescope.nvim" }

M.init = function()
end

M.config = function()
    require("telescope").load_extension("dap")
end

-- M.branch = ""

-- M.event = {}
-- M.cmd = {}
-- M.ft = {}
-- M.keys = {}

M.priority = 50

return M

