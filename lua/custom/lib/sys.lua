M = {}

M.isDarwin = vim.loop.os_uname().sysname == "Darwin"

return M
