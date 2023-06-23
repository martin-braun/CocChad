-- Neovim Plugins
local M = require("custom.chad.vscode.specs._stock")

local specs = {
   "codeium_vim",
   "deepl_vim",
}

local vscspecs = {

}

for _ , spec in ipairs( specs  )  do
   table.insert(M, require("custom.chad.specs." .. spec))
end

for _ , spec in ipairs( vscspecs  )  do
   table.insert(M, require("custom.chad.vscode.specs." .. spec))
end

return M
