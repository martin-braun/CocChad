local M = require("custom.chad.mappings")

local script = { script = true }
local silent = { silent = true }
local nowait = { nowait = true }
local noremap = { noremap = true }
local expr = { expr = true }
local no_replace_keycodes = { replace_keycodes = false }

M.disabled = {
    n = {
        ["<leader>e"] = nil, -- undo nvim-tree
    }
}

M.general.n["<leader>uu"] = nil
M.general.n["<leader>sl"] = nil
M.general.n["<C-s>"] = nil
M.general.n["<leader>y"] = nil
M.general.n["<leader>ss"] = nil
M.general.n["<leader>sl"] = nil
M.general.i["<C-s>"] = nil
M.general.v["<C-s>"] = nil
M.general.v["<leader>ss"] = nil

M.telescope = nil
M.nvimtree = nil
M.base46 = nil
M.tabufline = nil
M.coc = nil
M.dap = nil
M.hex = nil
M.arduino = nil
M.codeium = nil

return M
