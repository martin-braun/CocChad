local compat = require("custom.compat")

local autocmds = {
    { true, "ft.log" },
    { true, "ft.reg" },
    { true, "ft.xaml" },
    { not compat, "mods.nvim_tree" },
    { vim.g.vscode, "vscode.ui" },
}

for _ , autocmd in ipairs( autocmds  )  do
    if autocmd[1] then
        require("custom.neo.autocmd." .. autocmd[2])
    end
end
