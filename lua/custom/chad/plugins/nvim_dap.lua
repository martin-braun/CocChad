local M = {}

M.setup = function()
    local api = vim.api
    api.nvim_create_user_command("DapSetConditionalBreakpoint", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))", {})
    api.nvim_create_user_command("DapSetLogBreakpoint", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))", {})
    api.nvim_create_user_command("DapStepBack", ":lua require('dap').step_back()", {})
    api.nvim_create_user_command("DapReverseContinue", ":lua require('dap').reverse_continue()", {})
    api.nvim_create_user_command("DapRestart", ":lua require('dap').restart()", {})
    api.nvim_create_user_command("DapPause", ":lua require('dap').pause()", {})
    api.nvim_create_user_command("DapClose", ":lua require('dap').close()", {})
    api.nvim_create_user_command("DapGotoCurrentLine", ":lua require('dap').goto_()", {})
    api.nvim_create_user_command("DapListBreakpoints", ":lua require('dap').list_breakpoints(true)", {})
    api.nvim_create_user_command("DapClearBreakpoints", ":lua require'dap'.clear_breakpoints()", {})
    api.nvim_create_user_command("DapToggleMiniRepl", ":lua require('dap.repl').toggle({ height = 8 })", {})
    api.nvim_create_user_command("DapShowMiniLog", 'botright 8split | e ' .. vim.fn.stdpath('cache') .. '/dap.log | normal! G', {})
end

M.config = function()
    local dap = require('dap')
    dap.set_log_level('TRACE')
    -- dart/flutter
    local dart = require("custom.chad.plugins.dap.dart")
    dap.adapters.dart = dart.adapter
    dap.configurations.dart = dart.configuration
end

return M

