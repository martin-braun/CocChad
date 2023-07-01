require("custom.neo.autocmd.ft.reg")
require("custom.neo.autocmd.ft.xaml")

if vim.g.vscode then
    require("custom.neo.autocmd.vscode.ui")
end
