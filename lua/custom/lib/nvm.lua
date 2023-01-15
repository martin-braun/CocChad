local cmd = require("custom.lib.command")

local M = {}

M.system_node_active = function()
    local default_alias_name_file = io.open(op.getenv("NVM_DIR") .. "/alias/default")
    return default_alias_name_file ~= nil and default_alias_name_file:read() == "system"
end

M.node_lts_path = function()
    local lts_index_file = io.open(os.getenv("NVM_DIR") .. "/alias/lts/*")
    local lts_path_lookup_filename = os.getenv("NVM_DIR") .. "/alias/" .. lts_index_file:read()
    local lts_path_file = io.open(lts_path_lookup_filename)
    local lts_path = os.getenv("NVM_DIR") .. "/versions/node/" .. lts_path_file:read()
    lts_index_file.close()
    lts_path_file.close()
    return lts_path
end

return M

