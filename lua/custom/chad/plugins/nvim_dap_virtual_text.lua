local M = {}

M.requires = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" }
M.wants = "nvim-dap"
M.after = "nvim-dap"

M.setup = function()
end

M.config = function()
    require("nvim-dap-virtual-text").setup()
end

return M

