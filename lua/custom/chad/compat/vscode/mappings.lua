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

-- Note ctrl+n/p are directly send to VSCode, thus they can't and won't be remapped in Neovim.
M.vscode = {
    n = {
        ---- nvchad substitute:
        ["<C-c>"] = { "<CMD>call VSCodeCall('search.action.clearSearchResults')<CR><CMD>call VSCodeCall('workbench.action.focusActiveEditorGroup')<CR>", "Search: Clear Search Results", opts = silent },
        ["<leader>e"] = { "<CMD>call VSCodeCall('workbench.files.action.focusFilesExplorer')<CR>", "File: Focus on Files Explorer", opts = nowait },
        ["<leader>fi"] = { "<CMD>call VSCodeCall('editor.action.formatDocument')<CR>", "Format Document", opts = nowait },
        ["gf"] = { "<CMD>call VSCodeCall('seito-openfile.openFileFromText')<CR>", "File: Open file under cursor", opts = nowait },
        ["<C-w>q"] = { "<CMD>call VSCodeCall('workbench.action.closeEditorsAndGroup')<CR>", "View: Close Editor Grous", opts = nowait },

        ---- fix scrolling
        ["<C-d>"] = { '<C-d>zz', "Scroll down", opts = vim.tbl_extend("error", silent, nowait) },
        ["<C-u>"] = { '<C-u>zz', "Scroll up", opts = vim.tbl_extend("error", silent, nowait) },

        ---- telescope substitute:
        ["<CR>"] = { "<CMD>call VSCodeNotify('workbench.action.showCommands', { 'query': expand('<cword>')})<CR>", "Show All Commands" },
        -- ["<C-p>"] = { "<CMD>call VSCodeNotify('workbench.action.quickOpen')<CR>", "Go to File..." },
        ["<C-_>"] = { "<CMD>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>", "Search: Find in Files" }, -- CTRL+7

        -- ["<leader>fk"] = { "<CMD>Telescope keymaps <CR>", "Show keys" },
        -- ["<leader>fg"] = { "<CMD>Telescope git_commits <CR>", "Git commits" },
        ["<C-g>"] = { "<CMD>Telescope git_status <CR>", "Git status" },

        ---- nvimtree substitute:
        ["<C-e>"] = { "<CMD>call VSCodeCall('workbench.files.action.focusFilesExplorer')<CR>", "File: Focus on Files Explorer" },

        ---- tabufline substitute:
        ["<leader>cn"] = { "<CMD>call VSCodeCall('workbench.action.files.newUntitledFile')<CR>", "File: New Untitled Text File", opts = nowait },
        ["<C-w>h"] = { "<CMD>call VSCodeCall('workbench.action.navigateLeft')<CR>", "View: Navigate to the View on the Left", opts = nowait },
        ["<C-w><Left>"] = { "<CMD>call VSCodeCall('workbench.action.navigateLeft')<CR>", "View: Navigate to the View on the Left", opts = nowait },
        ["<C-w>l"] = { "<CMD>call VSCodeCall('workbench.action.navigateLeft')<CR>", "View: Navigate to the View on the Left", opts = nowait },
        ["<C-w><Right>"] = { "<CMD>call VSCodeCall('workbench.action.navigateRight')<CR>", "View: Navigate to the View on the Right", opts = nowait },
        ["<C-w>k"] = { "<CMD>call VSCodeCall('workbench.action.focusAboveGroup')<CR>", "View: Focus Editor Group Above", opts = nowait }, -- undo navigateUp
        ["<C-w><Up>"] = { "<CMD>call VSCodeCall('workbench.action.focusAboveGroup')<CR>", "View: Focus Editor Group Above", opts = nowait }, -- undo navigateUp
        ["<C-w>j"] = { "<CMD>call VSCodeCall('workbench.action.focusBelowGroup')<CR>", "View: Focus Editor Group Below", opts = nowait }, -- undo navigateDown
        ["<C-w><Down>"] = { "<CMD>call VSCodeCall('workbench.action.focusBelowGroup')<CR>", "View: Focus Editor Group Below", opts = nowait }, -- undo navigateDown
        ["<C-j>"] = { "<CMD>call VSCodeCall('workbench.action.nextEditorInGroup')<CR>", "View: Open Next Editor in Group", opts = nowait },
        ["<leader>j"] = { "<CMD>call VSCodeCall('workbench.action.moveEditorRightInGroup')<CR>", "View: Move Editor Right", opts = nowait },
        ["<C-k>"] = { "<CMD>call VSCodeCall('workbench.action.previousEditorInGroup')<CR>", "View: Open Previous Editor in Group", opts = nowait },
        ["<leader>k"] = { "<CMD>call VSCodeCall('workbench.action.moveEditorLeftInGroup')<CR>", "View: Move Editor Left", opts = nowait },
        ["<C-q>"] = { "<CMD>call VSCodeCall('workbench.action.closeActiveEditor')<CR>", "View: Close Editor", opts = nowait },
        ["<leader>Q"] = { "<CMD>call VSCodeCall('workbench.action.closeEditorsToTheRight')<CR>", "View: Close Editors to the Right in Group", opts = nowait },
        ["<C-w>\""] = { "<CMD>call VSCodeCall('workbench.action.splitEditorDown')<CR>", "View: Split Editor Down", opts = nowait },
        ["<C-w>%"] = { "<CMD>call VSCodeCall('workbench.action.splitEditorRight')<CR>", "View: Split Editor Right", opts = nowait },
        ["<C-w>x"] = { "<CMD>call VSCodeCall('workbench.action.closeActiveEditor')<CR>", "View: Close Editor", opts = nowait },
        ["<C-w>+"] = { "<CMD>call VSCodeCall('workbench.action.increaseViewHeight')<CR>", "Increase Editor Height", opts = nowait },
        ["<C-w>-"] = { "<CMD>call VSCodeCall('workbench.action.decreaseViewHeight')<CR>", "Decrease Editor Height", opts = nowait },
        ["<C-w>>"] = { "<CMD>call VSCodeCall('workbench.action.increaseViewWidth')<CR>", "Increase Editor Width", opts = nowait },
        ["<C-w><"] = { "<CMD>call VSCodeCall('workbench.action.decreaseViewWidth')<CR>", "Decrease Editor Width", opts = nowait },

        ---- coc substitute:
        ["<leader>ff"] = { "<CMD>call VSCodeCall('editor.action.formatDocument')<CR>", "Format Document", opts = nowait },
        ["<leader>FF"] = { "<CMD>call VSCodeCall('editor.action.formatDocument')<CR><CMD>call VSCodeCall('workbench.action.files.save')<CR>", "Format Document and Save", opts = nowait },
        ["<leader>x"] = { "<CMD>call VSCodeCall('editor.action.refactor')<CR>", "View: Show Extensions", opts = vim.tbl_extend("error", silent, nowait) },
        ["gr"] = { "<CMD>call VSCodeCall('editor.action.goToReferences')<CR>", "Go to References", opts = silent },
        ["<leader>rn"] = { "<CMD>call VSCodeCall('editor.action.rename')<CR>", "Rename Symbol", opts = silent },
        ["<leader>fl"] = { "<CMD>call VSCodeCall('editor.action.quickFix')<CR>", "Quick Fix...", opts = silent },
        -- coc-flutter
        ["<leader>sfe"] = { "<CMD>call VSCodeCall('flutter.launchEmulator')<CR>", "Flutter: Launch Emulator", opts = silent },
        ["<leader>sfd"] = { "<CMD>call VSCodeCall('flutter.selectDevice')<CR>", "Flutter: Select Device", opts = silent },
        ["<leader>sfs"] = { "<CMD>call VSCodeCall('dart.changeFlutterSdk')<CR>", "Flutter: Change SDK", opts = silent },
        ["<leader>sfr"] = { "<CMD>call VSCodeCall('workbench.action.debug.start')<CR>", "Debug: Start Debugging", silent },
        ["<leader>sfD"] = { "<CMD>call VSCodeCall('flutter.doctor')<CR>", "Flutter: Run Flutter Doctor" },
        ["<leader>sfC"] = { "<CMD>call VSCodeCall('flutter.clean')<CR>", "Flutter: Clean Project" },
        ["<leader>sfg"] = { "<CMD>call VSCodeCall('pub.get')<CR>", "Pub: Get Packages" },
        ["<leader>sfq"] = { "<CMD>call VSCodeCall('workbench.action.debug.stop')<CR>", "Debug: Stop" },
        ["<leader>sfR"] = { "<CMD>call VSCodeCall('flutter.hotRestart')<CR>", "Flutter: Hot Restart" },
        ["<leader>sfl"] = { "<CMD>call VSCodeCall('workbench.panel.repl.view.focus')<CR>", "Debug Console: Focus on Debug Console View" },
        ["<leader>sfc"] = { "<CMD>call VSCodeCall('workbench.debug.panel.action.clearReplAction')<CR>", "Clear Console" },
        ["<leader>sfp"] = { "<CMD>call VSCodeCall('flutter.togglePerformanceOverlay')<CR>", "Flutter: Toggle Performance Overlay" },
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
