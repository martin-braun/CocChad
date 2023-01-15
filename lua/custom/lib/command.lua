
local M = {}

M.resolved_invoker_of = function(command)
    local resolver = io.popen("command -v " .. command .. " 2>/dev/null || echo ''")
    local invoker = resolver:read()
    resolver:close()
    return invoker
end

return M

