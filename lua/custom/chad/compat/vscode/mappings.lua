local M = require("custom.chad.compat.base.mappings")

local script = { script = true }
local silent = { silent = true }
local nowait = { nowait = true }
local noremap = { noremap = true }
local expr = { expr = true }
local no_replace_keycodes = { replace_keycodes = false }

M.general.n["<leader>uu"] = nil
M.general.n["<leader>sl"] = nil
M.general.n["<C-s>"] = { "<CMD>call VSCodeCall('workbench.action.files.save')<CR>", "Save", opts = nowait }
M.general.n["<leader>y"] = nil
M.general.n["<leader>ss"] = { "<CMD>call VSCodeCall('workbench.action.files.saveAll')<CR>", "Save all files", opts = nowait }
M.general.n["<leader>sl"] = nil

M.general.i["<C-s>"] = { "<CMD>call VSCodeCall('workbench.action.files.save')<CR>", "Save", opts = nowait }
 
M.general.v["<C-s>"] = { "<CMD>call VSCodeCall('workbench.action.files.save')<CR>", "Save", opts = nowait }
M.general.v["<leader>ss"] = { "<CMD>call VSCodeCall('workbench.action.files.saveAll')<CR>", "Save all files", opts = nowait }

M.vscode = {
    n = {
        ---- fix scrolling
        ["<C-d>"] = { '<C-d>zz', "Scroll down", opts = vim.tbl_extend("error", silent, nowait) },
        ["<C-u>"] = { '<C-u>zz', "Scroll up", opts = vim.tbl_extend("error", silent, nowait) },

        ---- nvchad substitute:
        ["<leader>e"] = { "<CMD>call VSCodeCall('workbench.files.action.focusFilesExplorer')<CR>", "File: Focus on Files Explorer", opts = nowait },
        ["<leader>fi"] = { "<CMD>call VSCodeCall('editor.action.formatDocument')<CR>", "Format Document", opts = nowait },
        ["gf"] = { "<CMD>call VSCodeCall('seito-openfile.openFileFromText')<CR>", "File: Open file under cursor", opts = nowait },

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
        ["<C-w>h"] = { "<CMD>call VSCodeCall('workbench.action.navigateLeft')<CR>", "View: Navigate to the View on the Left", opts = nowait },
        ["<C-w><Left>"] = { "<CMD>call VSCodeCall('workbench.action.navigateLeft')<CR>", "View: Navigate to the View on the Left", opts = nowait },
        ["<C-w>l"] = { "<CMD>call VSCodeCall('workbench.action.navigateLeft')<CR>", "View: Navigate to the View on the Left", opts = nowait },
        ["<C-w><Right>"] = { "<CMD>call VSCodeCall('workbench.action.navigateRight')<CR>", "View: Navigate to the View on the Right", opts = nowait },
        ["<C-w>k"] = { "<CMD>call VSCodeCall('workbench.action.focusAboveGroup')<CR>", "View: Focus Editor Group Above", opts = nowait }, -- undo navigateUp
        ["<C-w><Up>"] = { "<CMD>call VSCodeCall('workbench.action.focusAboveGroup')<CR>", "View: Focus Editor Group Above", opts = nowait }, -- undo navigateUp
        ["<C-w>j"] = { "<CMD>call VSCodeCall('workbench.action.focusBelowGroup')<CR>", "View: Focus Editor Group Below", opts = nowait }, -- undo navigateDown
        ["<C-w><Down>"] = { "<CMD>call VSCodeCall('workbench.action.focusBelowGroup')<CR>", "View: Focus Editor Group Below", opts = nowait }, -- undo navigateDown
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
        ["<leader>x"] = { "<CMD>call VSCodeCall('editor.action.refactor')<CR>", "View: Show Extensions", opts = vim.tbl_extend("error", silent, nowait) },
        ["gr"] = { "<CMD>call VSCodeCall('editor.action.goToReferences')<CR>", "Go to References", opts = silent },
        ["<leader>rn"] = { "<CMD>call VSCodeCall('editor.action.rename')<CR>", "Rename Symbol", opts = silent },
        ["<leader>fl"] = { "<CMD>call VSCodeCall('editor.action.quickFix')<CR>", "Quick Fix...", opts = silent },
    },
    v = {
        ---- fix scrolling
        ["<C-d>"] = { '<C-d>zz', "Scroll down", opts = vim.tbl_extend("error", silent, nowait) },
        ["<C-u>"] = { '<C-u>zz', "Scroll up", opts = vim.tbl_extend("error", silent, nowait) },

        ---- coc substitute:
        ["<leader>ff"] = { "<CMD>call VSCodeCall('editor.action.formatDocument')<CR>", "Format Document", opts = nowait },
        ["<leader>FF"] = { "<CMD>call VSCodeCall('editor.action.formatDocument')<CR><CMD>call VSCodeCall('workbench.action.files.save')<CR>", "Format Document and Save", opts = nowait },
        ["<leader>fl"] = { "<CMD>call VSCodeCall('editor.action.quickFix')<CR>", "Quick Fix...", opts = silent },
    },
    i = {
        ---- fix scrolling
        ["<C-d>"] = { '<C-d><ESC>zza', "Scroll down", opts = vim.tbl_extend("error", silent, nowait) },
        ["<C-u>"] = { '<C-u><ESC>zza', "Scroll up", opts = vim.tbl_extend("error", silent, nowait) },
    }
}

M.codeium = {
    n = {
        ["<leader>mn"] = { "<CMD>VSCodeCall('codeium.showNextCompletion')<CR>", "Codeium: Show Next Completion", opts = silent },
        ["<leader>mp"] = { "<CMD>VSCodeCall('codeium.showPreviousCompletion')<CR>", "Codeium: Show Previous Completion", opts = silent },
    }
}

return M
