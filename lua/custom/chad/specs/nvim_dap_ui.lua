local compat = require("custom.compat")

local M = { "rcarriga/nvim-dap-ui" }

M.name = "nvim_dap_ui"
M.lazy = true
M.cond = not compat
M.dependencies = { "nvim_dap" }

M.init = function()
    local api = vim.api
    api.nvim_create_user_command("DapUiOpen", ":lua require'dapui'.open()", {})
    api.nvim_create_user_command("DapUiClose", ":lua require'dapui'.close()", {})
    api.nvim_create_user_command("DapUiToggle", ":lua require'dapui'.toggle()", {})
    api.nvim_create_user_command("DapUiFloatElement", ":lua require'dapui'.float_element()", {})
    api.nvim_create_user_command("DapUiEval", ":lua require'dapui'.eval()", {})
end

M.config = function()
    local dap, dapui = require('dap'), require('dapui')
    dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
    end
    dap.listeners.after.event_terminated['dapui_config'] = function()
        dapui.close()
    end
    dap.listeners.after.event_exited['dapui_config'] = function()
        dapui.close()
    end
    dapui.setup()
end

-- M.branch = ""

-- M.event = {}
-- M.cmd = {}
-- M.ft = {}
M.keys = { "<leader>d" }

M.priority = 50

return M
