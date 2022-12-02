local M = {}

M.ruby_global_path = function()
    local p = io.popen("rbenv global")
    local result = os.getenv("HOME") .. "/.rbenv/versions/" .. p:read()
    p:close()
    return result
end

return M

