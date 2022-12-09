local M = {}

M.requires = { "mfussenegger/nvim-dap", "nvim-telescope/telescope.nvim" }
M.wants = { "nvim-dap", "telescope.nvim" }
M.after = { "nvim-dap", "telescope.nvim" }

M.setup = function()
end

M.config = function()
    require("telescope").load_extension("dap")
end

return M

