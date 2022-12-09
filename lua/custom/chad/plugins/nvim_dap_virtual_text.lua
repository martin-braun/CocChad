local M = {}

M.requires = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" }
M.wants = { "nvim-dap", "nvim-treesitter" }
M.after = { "nvim-dap", "nvim-treesitter" }

M.setup = function()
end

M.config = function()
end

M.override_options = function() -- setup
    return {}
end

return M

