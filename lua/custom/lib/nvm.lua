local M = {}

M.node_lts_path = function()
    local lts_index_file = io.open(os.getenv("HOME") .. "/.nvm/alias/lts/*")
    local lts_path_lookup_filename = os.getenv("HOME") .. "/.nvm/alias/" .. lts_index_file:read()
    local lts_path_file = io.open(lts_path_lookup_filename)
    local lts_path = os.getenv("HOME") .. "/.nvm/versions/node/" .. lts_path_file:read()
    lts_index_file.close()
    lts_path_file.close()
    return lts_path
end

return M

