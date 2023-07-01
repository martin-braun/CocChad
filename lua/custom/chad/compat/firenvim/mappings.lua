local M = require("custom.chad.compat.base.mappings")

local script = { script = true }
local silent = { silent = true }
local nowait = { nowait = true }
local noremap = { noremap = true }
local expr = { expr = true }
local no_replace_keycodes = { replace_keycodes = false }

M.firenvim = {
    n = {
        -- no mouse
        ["<LeftMouse>"] = { "<nop>", "" },
        ["<MiddleMouse>"] = { "<nop>", "" },
        ["<RightMouse>"] = { "<nop>", "" },
        -- dead keys
        ["^1"] = { "^", "", opts = nowait },
        ["à"] = { "`a", "", opts = nowait },
        ["Á"] = { "'A", "", opts = nowait },
        ["À"] = { "`A", "", opts = nowait },
        ["ç"] = { "'c", "", opts = nowait },
        ["Ç"] = { "'C", "", opts = nowait },
        ["é"] = { "'e", "", opts = nowait },
        ["è"] = { "`e", "", opts = nowait },
        ["É"] = { "'E", "", opts = nowait },
        ["È"] = { "`E", "", opts = nowait },
        ["í"] = { "'i", "", opts = nowait },
        ["ì"] = { "`i", "", opts = nowait },
        ["Í"] = { "'I", "", opts = nowait },
        ["Ì"] = { "`I", "", opts = nowait },
        ["ó"] = { "'o", "", opts = nowait },
        ["ò"] = { "`o", "", opts = nowait },
        ["Ó"] = { "'O", "", opts = nowait },
        ["Ò"] = { "`O", "", opts = nowait },
        ["ú"] = { "'u", "", opts = nowait },
        ["ù"] = { "`u", "", opts = nowait },
        ["Ú"] = { "'U", "", opts = nowait },
        ["Ù"] = { "`U", "", opts = nowait },
        -- cmd to ctrl
        ["<D-r>"] = { "<C-r>", "" },
        ["<D-a>"] = { "<C-a>", "" },
        ["<D-x>"] = { "<C-x>", "" },
        ["<D-c>"] = { "ZZ", "" },
        ["<D-v>"] = { "<C-v>", "" },
        ["<D-b>"] = { "<C-b>", "" },
    },
    i = {
        -- no mouse
        ["<LeftMouse>"] = { "<nop>", "" },
        ["<MiddleMouse>"] = { "<nop>", "" },
        ["<RightMouse>"] = { "<nop>", "" },
        -- cmd to ctrl
        ["<D-c>"] = { "<C-c>", "" },
    },
    v = {
        -- no mouse
        ["<LeftMouse>"] = { "<nop>", "" },
        ["<MiddleMouse>"] = { "<nop>", "" },
        ["<RightMouse>"] = { "<nop>", "" },
        -- cmd to ctrl
        ["<D-c>"] = { "<C-c>", "" },
    },
}

return M
