local M = require("custom.chad.mappings")

local script = { script = true }
local silent = { silent = true }
local nowait = { nowait = true }
local noremap = { noremap = true }
local expr = { expr = true }
local noreplace_keycodes = { replace_keycodes = false }

M.general.n["<leader>uu"] = nil
M.general.n["<leader>sl"] = nil
M.general.n["<C-s>"] = { "<CMD>call VSCodeCall('workbench.action.files.save')<CR>", "Save", opts = nowait }
M.general.n["<leader>y"] = nil
M.general.n["<leader>ss"] = { "<CMD>call VSCodeCall('workbench.action.files.saveAll')<CR>", "Save all files", opts = nowait }
M.general.n["<leader>sl"] = nil

M.general.i["<C-s>"] = { "<CMD>call VSCodeCall('workbench.action.files.save')<CR>", "Save", opts = nowait }
 
M.general.v["<C-s>"] = { "<CMD>call VSCodeCall('workbench.action.files.save')<CR>", "Save", opts = nowait }
M.general.v["<leader>ss"] = { "<CMD>call VSCodeCall('workbench.action.files.saveAll')<CR>", "Save all files", opts = nowait }

M.telescope = nil
M.nvimtree = nil
M.base46 = nil
M.tabufline = nil
M.coc = nil
M.dap = nil
M.hex = nil
M.arduino = nil

M.vscode = {
    n = {
        ---- nvchad substitute:
        ["<leader>e"] = { "<CMD>call VSCodeCall('workbench.files.action.focusFilesExplorer')<CR>", "File: Focus on Files Explorer", opts = nowait },
        ---- telescope substitute:
        ["<CR>"] = { "<CMD>call VSCodeNotify('workbench.action.showCommands', { 'query': expand('<cword>')})<CR>", "Show All Commands" },
        ["<C-p>"] = { "<CMD>call VSCodeNotify('workbench.action.quickOpen')<CR>", "Go to File..." },
        ["<C-_>"] = { "<CMD>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>", "Search: Find in Files" }, -- CTRL+7
        -- ["<leader>fk"] = { "<CMD>Telescope keymaps <CR>", "Show keys" },
        -- ["<leader>fg"] = { "<CMD>Telescope git_commits <CR>", "Git commits" },
        ["<C-g>"] = { "<CMD>Telescope git_status <CR>", "Git status" },

        ---- nvimtree substitute:
        ["<C-e>"] = { "<CMD>call VSCodeCall('workbench.files.action.focusFilesExplorer')<CR>", "File: Focus on Files Explorer" },
        
        ---- tabufline substitute:
        ["<C-n>"] = { "<CMD>call VSCodeCall('workbench.action.files.newUntitledFile')<CR>", "File: New Untitled Text File", opts = nowait },
        ["<C-w>c"] = { "<CMD>call VSCodeCall('workbench.action.files.newUntitledFile')<CR>", "File: New Untitled Text File", opts = nowait },
        ["<C-w>n"] = { "<CMD>call VSCodeCall('workbench.action.nextEditor')<CR>", "View: Open Next Editor", opts = nowait },
        ["<C-j>"] = { "<CMD>call VSCodeCall('workbench.action.nextEditorInGroup')<CR>", "View: Open Next Editor in Group", opts = nowait },
        ["<leader>j"] = { "<CMD>call VSCodeCall('workbench.action.moveEditorRightInGroup')<CR>", "View: Move Editor Right", opts = nowait },
        ["<C-w>p"] = { "<CMD>call VSCodeCall('workbench.action.previousEditor')<CR>", "View: Open Previous Editor", opts = nowait },
        ["<C-k>"] = { "<CMD>call VSCodeCall('workbench.action.previousEditorInGroup')<CR>", "View: Open Previous Editor in Group", opts = nowait },
        ["<leader>k"] = { "<CMD>call VSCodeCall('workbench.action.moveEditorLeftInGroup')<CR>", "View: Move Editor Left", opts = nowait },
        ["<C-q>"] = { "<CMD>call VSCodeCall('workbench.action.closeActiveEditor')<CR>", "View: Close Editor", opts = nowait },
        ["<leader>Q"] = { "<CMD>call VSCodeCall('workbench.action.closeEditorsToTheRight')<CR>", "View: Close Editors to the Right in Group", opts = nowait },
        
        ---- coc substitute:
        ["<leader>ff"] = { "<CMD>call VSCodeCall('editor.action.formatDocument')<CR>", "Format Document", opts = nowait },
        ["<leader>FF"] = { "<CMD>call VSCodeCall('editor.action.formatDocument')<CR><CMD>call VSCodeCall('workbench.action.files.save')<CR>", "Format Document and Save", opts = nowait },
        
        ---- tmux substitute:
        ['<C-t>"'] = { "<CMD>call VSCodeCall('terminal.focus')<CR>", "Terminal: Focus on Terminal View", opts = nowait },
        
        ---- temporary scrollfix:
        ['<C-u>"'] = { "<C-u>zz", "Scroll up", opts = nowait },
        ['<C-d>"'] = { "<C-d>zz", "Scroll up", opts = nowait },
    },
    v = {
        ---- coc substitute:
        ["<leader>ff"] = { "<CMD>call VSCodeCall('editor.action.formatDocument')<CR>", "Format Document", opts = nowait },
        ["<leader>FF"] = { "<CMD>call VSCodeCall('editor.action.formatDocument')<CR><CMD>call VSCodeCall('workbench.action.files.save')<CR>", "Format Document and Save", opts = nowait },
    },
}

return M
