if vim.g.vscode then
    return "vscode"
elseif not not vim.g.started_by_firenvim then
    return "firenvim"
end

return false
