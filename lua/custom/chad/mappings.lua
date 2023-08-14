local M = {}

local script = { script = true }
local silent = { silent = true }
local nowait = { nowait = true }
local noremap = { noremap = true }
local expr = { expr = true }
local no_replace_keycodes = { replace_keycodes = false }

M.disabled = {
    n = {
        ["<tab>"] = "", -- undo buffer navigation
        ["<S-tab>"] = "", -- undo buffer navigation
        ["<Right>"] = "", -- undo special navigation rules using arrow keys
        ["<Down>"] = "", -- undo special navigation rules using arrow keys
        ["<Up>"] = "", -- undo special navigation rules using arrow keys
        ["<Left>"] = "", -- undo special navigation rules using arrow keys
        ["j"] = "", -- undo navigating through wrapped text, use gj instead
        ["k"] = "", -- undo navigating through wrapped text, use gk instead
        ["<C-c>"] = "", -- undo whatever happens on C-c
        ["<C-g>"] = "", -- undo file info
        ["<C-h>"] = "", -- undo window jump, prefix with ^W instead
        ["<C-j>"] = "", -- undo window jump, prefix with ^W instead
        ["<C-k>"] = "", -- undo window jump, prefix with ^W instead
        ["<C-l>"] = "", -- undo window jump, prefix with ^W instead
        ["<C-q>"] = "", -- undo V-Block, use <C-v> instead
        ["<C-n>"] = "", -- undo toggle nvim tree
        ["<C-w>x"] = "", -- undo swap window with next
        ["<C-w>c"] = "", -- undo close window
        ["<C-w>w"] = "", -- undo next window
        ["<C-w>p"] = "", -- undo previous window
        ["<leader>b"] = "", -- undo <leader>b new buffer, use C-n instead
        ["<leader>x"] = "", -- undo <leader>x close buffer, use <C-q> instead
        ["<leader>q"] = "", -- undo diagnostics
        ["<leader>tk"] = "", -- undo find keys with telescope, use <leader>fk instead
        ["<leader>cm"] = "", -- undo git commits, use <leader>fg
        ["<leader>cc"] = "", -- undo jump to current context
        ["<leader>ca"] = "", -- undo LSP code action
        ["<leader>ch"] = "", -- undo mapping cheatsheet
        ["<leader>gt"] = "", -- undo git status, use <C-g> instead
        ["<leader>rn"] = "", -- undo toggle relative numbers, keep it as it is
        ["<leader>pt"] = "", -- undo pick hidden terminal
        ["<leader>ph"] = "", -- undo preview hunk terminal
    },
    i = {
        ["<Right>"] = "", -- undo special navigation rules using arrow keys
        ["<Down>"] = "", -- undo special navigation rules using arrow keys
        ["<Up>"] = "", -- undo special navigation rules using arrow keys
        ["<Left>"] = "", -- undo special navigation rules using arrow keys
        ["<C-e>"] = "", -- undo jumping to end of line, use normal mode
        ["<C-b>"] = "", -- undo jumping to begin of line, use normal mode
        ["<C-h>"] = "", -- undo moving in insert mode, use fn modifier instead
        ["<C-j>"] = "", -- undo moving in insert mode, use fn modifier instead
        ["<C-k>"] = "", -- undo moving in insert mode, use fn modifier instead
        ["<C-l>"] = "", -- undo moving in insert mode, use fn modifier instead
        ["<C-p>"] = "", -- undo moving up
    },
    x = {
        ["j"] = "", -- undo navigating through wrapped text, use gj instead
        ["k"] = "", -- undo navigating through wrapped text, use gk instead
        ["p"] = "", -- undo not copying text that got replaced by paste
    },
}

M.general = {
    n = {
        ["<leader>uu"] = { "<CMD>NvChadUpdate<CR>", "Update NvChad" },
        ["<leader>fi"] = { "mqgg=G`qzz", "Fix indentions" },
        ["<C-s>"] = { "<CMD>w<CR>", "Save" },
        ["<leader>y"] = { "<CMD>Lazy<CR>", "Open layz", opts = nowait },
        ["<leader>ss"] = { "<CMD>wall<CR><CMD>mks!<CR>", "Save all files and local session", opts = nowait },
        ["<leader>sl"] = { '<CMD>silent exec "source Session.vim"<CR>', "Load local session", opts = nowait },
        ["<leader>ti"] = { "a<C-r>=strftime('%y-%m-%d %H:%M:%S')<C-m><C-c>", "Insert time", opts = nowait },
        ["<leader>ts"] = { "a<C-r>=strftime('%y%m%d_%H%M%S')<C-m><C-c>", "Insert timestamp", opts = nowait },
        ["<leader>tu"] = { "a<C-r>=strftime('%s')<C-m><C-c>", "Insert unix epoch timestamp", opts = nowait },
        ["<leader>l"] =  { "<CMD>cw<CR><CMD>.cc<CR>zv", "Open quickfix list and jump to selected entry or close if empty" },
        ["<leader>q"] =  { "<CMD>ccl<CR>", "Close quickfix list", opts = nowait },
        ["<leader>n"] =  { "<CMD>cw<CR><CMD>cn<CR>zv", "Open quickfix list and jump to next entry or close if empty", opts = nowait },
        ["<leader>p"] =  { "<CMD>cw<CR><CMD>cp<CR>zv", "Open quickfix list and jump to previous entry or close if empty", opts = nowait },
        ["<leader>o"] =  { "<CMD>pop<CR>", "Move upwards/back in the tag stack", opts = nowait },
        ["<leader>i"] =  { "<CMD>tag<CR>", "Move downwards/forward the tag stack", opts = nowait },
        ["<leader>tn"] = { "<CMD>tabnew<CR>", "New native tab", opts = nowait },
        ["<leader>tj"] = { "<CMD>tabnext<CR>", "Goto next native tab", opts = nowait },
        ["<leader>tk"] = { "<CMD>tabprevious<CR>", "Goto previous native tab", opts = nowait },
        ["<leader>tc"] = { "<CMD>tabclose<CR>", "Close current native tab", opts = nowait },
        ["<leader>to"] = { "<CMD>tabo<CR>", "Close all other native tabs", opts = nowait },
        ["<C-w>\""] = { "<CMD>split<CR>", "split window horizontally", opts = nowait },
        ["<C-w>%"] = { "<CMD>vsplit<CR>", "Split window vertically", opts = nowait },
        ["<C-w>x"] = { "<CMD>close<CR>", "Close window", opts = nowait },
        ["<C-w>+"] = { "8<C-w>+", "Grow window horizontally", opts = nowait },
        ["<C-w>-"] = { "8<C-w>-", "Shrink window horizontally", opts = nowait },
        ["<C-w>|"] = { "32<C-w>|", "Minimize window horizontally", opts = nowait },
        ["<C-w>>"] = { "8<C-w>>", "Grow window vertically", opts = nowait },
        ["<C-w><"] = { "8<C-w><", "Shrink window vertically", opts = nowait },
        ["<C-w>_"] = { "8<C-w>_", "Minimize window vertically", opts = nowait },
        ["<C-w>}"] = { "<CMD>wincmd r<CR>", "Rotate window clockwise", opts = nowait },
        ["<C-w>{"] = { "<CMD>wincmd R<CR>", "Rotate window counter clockwise", opts = nowait },
        ["<C-w>ª"] = { "<CMD>wincmd H<CR>", "Move window to the far-left", opts = nowait },
        ["<C-w>º"] = { "<CMD>wincmd J<CR>", "Move window to the far-bottom", opts = nowait },
        ["<C-w>∆"] = { "<CMD>wincmd K<CR>", "Move window to the far-top", opts = nowait },
        ["<C-w>@"] = { "<CMD>wincmd L<CR>", "Move window to the far-right", opts = nowait },
        -- fn alts
        ["F2"] = { "<CMD>wincmd w<CR>", "Jump to next window", opts = nowait },
        ["F4"] = { "<CMD>wincmd c<CR>", "Close window", opts = nowait },
    },
    i = {
        ["<C-s>"] = { "<CMD>w<CR>", "Save" },
    },
    v = {
        ["<leader>fi"] = { "mqgg=G`qzz", "Fix indentions" },
        ["<C-s>"] = { "<CMD>w<CR>", "Save" },
        ["<leader>ss"] = { "C<MD>wall<CR><CMD>mks!<CR>", "Save all files and local session", opts = nowait },
        ["<leader>ti"] = { "c<C-r>=strftime('%Y-%m-%d %H:%M:%S')<C-m><C-c>", "Insert time" },
        ["<leader>ts"] = { "c<C-r>=strftime('%Y%m%d_%H%M%S')<C-m><C-c>", "Insert timestamp" },
    },
}

M.telescope = {
    n = {
        ["<CR>"] = { "<CMD>Telescope <CR>", "Open Telescope" },
        ["<C-p>"] = { "<CMD>Telescope find_files hidden=true<CR>", "Find files" },
        ["<C-_>"] = { "<CMD>Telescope live_grep hidden=true<CR>", "Live grep" }, -- CTRL+7
        ["<leader>fk"] = { "<CMD>Telescope keymaps<CR>", "Show keys" },
        ["<leader>fg"] = { "<CMD>Telescope git_commits<CR>", "Git commits" },
        ["<C-g>"] = { "<CMD>Telescope git_status<CR>", "Git status" },
    },
}

M.nvimtree = {
    n = {
        ["<C-e>"] = { "<CMD>NvimTreeToggle<CR>", "Toggle nvimtree" },
    },
}

M.base46 = {
    n = {
        ["<leader>tt"] = {
            function()
                require("base46").toggle_theme()
            end, "Toggle Theme", opts = silent
        },
    }
}

M.tabufline = {
    n = {
        ["<C-n>"] = { "<CMD>enew<CR>", "Create buffer", opts = nowait },
        ["<C-j>"] = {
            function()
                require("nvchad_ui.tabufline").tabuflineNext()
            end, "Goto next buffer", opts = silent
        },
        ["<leader>j"] = {
            function()
                require("nvchad_ui.tabufline").move_buf(1)
            end,
            "Move buffer forward", opts = silent
        },
        ["<C-k>"] = {
            function()
                require("nvchad_ui.tabufline").tabuflinePrev()
            end,
            "Goto prev buffer", opts = silent
        },
        ["<leader>k"] = {
            function()
                require("nvchad_ui.tabufline").move_buf(-1)
            end,
            "Move buffer backward", opts = silent
        },
        ["<C-q>"] = {
            function()
                require("nvchad_ui.tabufline").close_buffer()
            end, "Goto next buffer", opts = silent
        },
        ["<leader>Q"] = {
            function()
                require("nvchad_ui.tabufline").closeBufs_at_direction("right")
            end,
            "Close buffers to the right", opts = silent
        },
    },
}

M.coc = {
    n = {
        ["<leader>ff"] = { "<CMD>Format<CR>", "Format code" },
        ["<leader>FF"] = { "<CMD>Format<CR><CMD>w<CR>", "Format code and save" },
        ["<C-d>"] = { 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', "Scroll down", opts = vim.tbl_extend("error", silent, nowait, expr) },
        ["<C-u>"] = { 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', "Scroll up", opts = vim.tbl_extend("error", silent, nowait, expr) },
        ["<leader>[]"] = { ':<C-u>CocList diagnostics<CR>', "Show all diagnostics", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>x"] = { ':<C-u>CocList extensions<CR>', "Manage extensions", opts = vim.tbl_extend("error", silent, nowait) },
        ["gs"] = { ':<C-u>CocList outline<CR>', "Goto the symbol of the current file", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>fs"] = { ':<C-u>CocList -I symbols<CR>', "Find symbols", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>j"] = { ':<C-u>CocNext<CR>', "Do default action for next item", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>k"] = { ':<C-u>CocPrev<CR>', "Do default action for previous item", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>r"] = { ':<C-u>CocListResume<CR>', "resume latest coc list", opts = vim.tbl_extend("error", silent, nowait) },
        ["[]g"] = { "<CMD>CocDiagnostics<CR>", "Show diagnostics" },
        ["[g"] = { "<Plug>(coc-diagnostic-prev)", "Navigate to previous diagnostic", opts = silent },
        ["]g"] = { "<Plug>(coc-diagnostic-next)", "Navigate to next diagnostic", opts = silent },
        ["gd"] = { "<Plug>(coc-definition)", "Goto definition", opts = silent },
        ["gt"] = { "<Plug>(coc-type-definition)", "Goto type definition", opts = silent },
        ["gw"] = { "<Plug>(coc-implementation)", "Goto implementation", opts = silent },
        ["gr"] = { "<Plug>(coc-references)", "Goto references", opts = silent },
        ["K"] = { '<CMD>lua _G.show_docs()<CR>', "Show documentation" },
        ["<leader>rn"] = { '<Plug>(coc-rename)', "Refactor rename symbol", opts = silent },
        ["<leader>rf"] = { '<CMD>CocCommand workspace.renameCurrentFile<CR>', "Refactor rename file", opts = silent },
        ["<leader>ar"] = { '<Plug>(coc-codeaction-selected)', "Add codeaction to selected region", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>ag"] = { '<Plug>(coc-codeaction)', "Apply code action to current buffer", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>fl"] = { '<Plug>(coc-fix-current)', "Autofix current line", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>ll"] = { '<Plug>(coc-codelens-action)', "Perform CodeLens action on the current line", opts = vim.tbl_extend("error", silent, nowait) },
        ["<C-y>"] = { '<Plug>(coc-range-select)', "Select ranges", opts = silent },
        ["<leader>uc"] = { '<CMD>CocUpdate<CR>', "Update coc extensions" },
        -- coc-flutter
        ["<leader>sfe"] = { '<CMD>CocList FlutterEmulators<CR>', "Launch Flutter emulator", opts = silent },
        ["<leader>sfE"] = { ':call jobstart("Emulator @flutter_emulator -no-snapshot-load")<CR>', "cold start flutter_emulator", opts = silent },
        ["<leader>sfd"] = { '<CMD>CocList FlutterDevices<CR>', "Select Flutter device target", opts = silent },
        ["<leader>sfs"] = { '<CMD>CocList FlutterSDKs<CR>', "Select Flutter SDK", opts = silent },
        ["<leader>sfr"] = { '<CMD>CocCommand flutter.run<CR><CMD>CocCommand flutter.dev.hotReload<CR>', "Run / hot reload Flutter app on device/emulator", silent },
        ["<leader>sfD"] = { '<CMD>CocCommand flutter.doctor<CR>', "Run Flutter doctor" },
        ["<leader>sfC"] = { '<CMD>new | r ! fvm flutter clean<CR>', "Run Flutter clean" },
        ["<leader>sfg"] = { '<CMD>CocCommand flutter.pub.get<CR>', "Run Flutter pub get" },
        ["<leader>sft"] = { '<CMD>new | r ! fvm flutter pub deps<CR>', "Run Flutter pub deps" },
        ["<leader>sfq"] = { '<CMD>CocCommand flutter.dev.quit<CR>', "Quit Flutter dev server" },
        ["<leader>sfR"] = { '<CMD>CocCommand flutter.dev.clearDevLog<CR><CMD>CocCommand flutter.dev.hotRestart<CR>', "Hot restart Flutter dev server" },
        ["<leader>sfl"] = { '<CMD>CocCommand flutter.dev.openDevLog<CR>', "Show Flutter dev log" },
        ["<leader>sfc"] = { '<CMD>CocCommand flutter.dev.clearDevLog<CR>', "Clear Flutter dev server log" },
        ["<leader>sfp"] = { '<CMD>CocCommand flutter.dev.showPerformanceOverlay<CR>', "Show Flutter dev server performance overlay" },
        -- coc-deno
        ["<leader>sdc"] = { '<CMD>CocCommand deno.cache<CR>', "Cache Deno dependencies" },
        ["<leader>sds"] = { '<CMD>CocCommand deno.status<CR>', "Show Deno language server status" },
        ["<leader>sdt"] = { '<CMD>CocCommand deno.task<CR>', "Show/run Deno tasks" },
        ["<leader>sdp"] = { '<CMD>CocCommand deno.performance<CR>', "Display the timing averages for the internal Deno instrumentation" },
        ["<leader>sdi"] = { '<CMD>CocCommand deno.initializeWorkspace<CR>', "Initialize Deno workspace configuration" },
        --coc-blade
        ["<leader>sbo"] = { '<CMD>CocCommand blade.showOutput<CR>', "Show blade output channel", opts = silent },
        ["<leader>sbf"] = { '<CMD>CocCommand blade.bladeFormatter.run<CR>', "Run blade-formatter", opts = silent },
    },
    i = {
        ["<C-d>"] = { 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', "Scroll down", opts = vim.tbl_extend("error", silent, nowait, expr) },
        ["<C-u>"] = { 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', "Scroll up", opts = vim.tbl_extend("error", silent, nowait, expr) },
        ["<C-n>"] = { 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<C-n>" : coc#refresh()', "Move suggestion down / show suggestions", opts = vim.tbl_extend("error", silent, noremap, expr, no_replace_keycodes) },
        ["<Down>"] = { 'coc#pum#visible() ? coc#pum#next(1) : "<Down>"', "Move suggestion down", opts = vim.tbl_extend("error", silent, noremap, expr, no_replace_keycodes) },
        ["<C-p>"] = { 'coc#pum#visible() ? coc#pum#prev(1) : "<C-p>"', "Move suggestion up", opts = vim.tbl_extend("error", silent, noremap, expr, no_replace_keycodes) },
        ["<Up>"] = { 'coc#pum#visible() ? coc#pum#prev(1) : "<Up>"', "Move suggestion up", opts = vim.tbl_extend("error", silent, noremap, expr, no_replace_keycodes) },
        ["<CR>"] = { 'coc#pum#visible() ? coc#pum#confirm() : "<CR>"', "Confirm selection", opts = vim.tbl_extend("error", silent, noremap, expr, no_replace_keycodes) },
        ["<C-e>"] = { '<Plug>(coc-snippets-expand-jump)', "Insert snippet" },
        ["<C-l>"] = { 'coc#refresh()', "Show suggestions", opts = vim.tbl_extend("error", silent, expr) },
    },
    v = {
        ["<leader>ff"] = { ':call CocActionAsync("Format")<CR>', "Format code" },
        ["<leader>FF"] = { "<CMD>w<CR><CMD>Format<CR><CMD>w<CR>", "Format code and save" },
        ["<C-d>"] = { 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', "scroll down", opts = vim.tbl_extend("error", silent, nowait, expr) },
        ["<C-u>"] = { 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', "scroll up", opts = vim.tbl_extend("error", silent, nowait, expr) },
    },
    x = {
        ["<leader>if"] = { '<Plug>(coc-funcobj-i)', "Map insert function object", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>af"] = { '<Plug>(coc-funcobj-a)', "Map append function object", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>ic"] = { '<Plug>(coc-classobj-i)', "Map insert class object", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>ac"] = { '<Plug>(coc-classobj-a)', "Map append class object", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>a"] = { '<Plug>(coc-codeaction-selected)', "Add codeaction to selected region", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>rn"] = { '<Plug>(coc-rename)', "Refactor rename symbol", opts = silent },
        ["<C-y>"] = { '<Plug>(coc-range-select)', "Select ranges", opts = silent },
    },
    o = {
        ["<leader>if"] = { '<Plug>(coc-funcobj-i)', "Map insert function object", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>af"] = { '<Plug>(coc-funcobj-a)', "Map append function object", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>ic"] = { '<Plug>(coc-classobj-i)', "Map insert class object", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>ac"] = { '<Plug>(coc-classobj-a)', "Map append class object", opts = vim.tbl_extend("error", silent, nowait) },
    },
}

M.dap = {
    n = {
        ["<F5>"] = { "<CMD>DapContinue<CR>", "Start/continue debugging", opts = silent },
        ["<leader>dr"] = { "<CMD>DapContinue<CR>", "Start/continue debugging", opts = silent },
        ["<leader>dR"] = { "<CMD>DapRestart<CR>", "Restart debugging", opts = silent },
        ["<F10>"] = { "<CMD>DapStepOver<CR>", "Step over next instruction while debugging", opts = silent },
        ["<leader>dn"] = { "<CMD>DapStepOver<CR>", "Step over next instruction while debugging", opts = silent },
        ["<F11>"] = { "<CMD>DapStepInto<CR>", "Step into next instruction while debugging", opts = silent },
        ["<leader>di"] = { "<CMD>DapStepInto<CR>", "Step into next instruction while debugging", opts = silent },
        ["<F12>"] = { "<CMD>DapStepOut<CR>", "Step out of current scope while debugging", opts = silent },
        ["<S-F5>"] = { "<CMD>DapTerminate<CR>", "Terminate debugging", opts = silent },
        ["<leader>dq"] = { "<CMD>DapTerminate<CR>", "Terminate process while debugging", opts = silent },
        ["<leader>dc"] = { "<CMD>DapClose<CR>", "Close process while debugging", opts = silent },
        ["<leader>do"] = { "<CMD>DapStepOut<CR>", "Step out of current scope while debugging", opts = silent },
        ["<leader>dp"] = { "<CMD>DapStepBack<CR>", "Step back to previous instruction while debugging", opts = silent },
        ["<leader>dP"] = { "<CMD>DapPause<CR>", "Pause debugger while debugging", opts = silent },
        ["<leader>dg"] = { "<CMD>DapGotoCurrentLine<CR>", "Go to current liner while debugging", opts = silent },
        ["<leader>dbb"] = { "<CMD>DapToggleBreakpoint<CR>", "Toggle breakpoint", opts = silent },
        ["<leader>dbc"] = { "<CMD>DapSetConditionalBreakpoint<CR>", "Set breakpoint with condition" },
        ["<leader>dbB"] = { "<CMD>DapSetLogBreakpoint<CR>", "Set breakpoint with log point message" },
        ["<leader>dbl"] = { "<CMD>DapListBreakpoints<CR>", "List breakpoints" },
        ["<leader>dbx"] = { "<CMD>DapClearBreakpoints<CR>", "Clear breakpoints", opts = silent },
        ["<leader>de"] = { "<CMD>DapToggleMiniRepl<CR>", "Toggle repl environment", opts = silent },
        ["<leader>dl"] = { "<CMD>DapShowMiniLog<CR>", "Show dap log", opts = silent },
        ["<leader>du"] = { "<CMD>DapUiToggle<CR>", "Toggle dap ui", opts = silent },
        ["<leader>df"] = { "<CMD>DapUiFloatElement<CR>", "Open floated element", opts = silent },
        ["<leader>dE"] = { "<CMD>DapUiEval<CR>", "Evaludate selected expression while debugging", opts = silent },
    }
}

M.arduino = {
    n = {
        ["<leader>aa"] = { "<CMD>ArduinoAttach<CR>", "Automatically attach to Arduino board", opts = silent },
        ["<leader>ab"] = { "<CMD>ArduinoChooseBoard<CR>", "Select the type of Arduino board", opts = silent },
        ["<leader>ap"] = { "<CMD>ArduinoChooseProgrammer<CR>", "Select the Arduino programmer", opts = silent },
        ["<leader>ao"] = { "<CMD>ArduinoChoosePort<CR>", "Select the Arduino serial port", opts = silent },
        ["<leader>av"] = { "<CMD>ArduinoVerify<CR>", "Build the Arduino sketch", opts = silent },
        ["<leader>au"] = { "<CMD>ArduinoUpload<CR>", "Build and upload the Arduino sketch", opts = silent },
        ["<leader>as"] = { "<CMD>ArduinoSerial<CR>", "Connect to the Arduino board for debugging over a serial port", opts = silent },
        ["<leader>aus"] = { "<CMD>ArduinoUploadAndSerial<CR>", "Build, upload the Arduino sketch, and connect for debugging", opts = silent },
        ["<leader>ai"] = { "<CMD>ArduinoInfo<CR>", "Display internal information", opts = silent },
    }
}

M.codeium = {
    n = {
        ["<leader>ma"] = { "<CMD>Codeium Auth<CR>", "Authenticate to Codeium", opts = silent },
        ["<leader>me"] = { "<CMD>Codeium Enable<CR>", "Enable Codeium", opts = silent },
        ["<leader>mbe"] = { "<CMD>Codeium EnableBuffer<CR>", "Enable Codeium in the current buffer", opts = silent },
        ["<leader>md"] = { "<CMD>Codeium Disable<CR>", "Disable Codeium", opts = silent },
        ["<leader>mbd"] = { "<CMD>Codeium DisableBuffer<CR>", "Disable Codeium in the current buffer", opts = silent },
        ["<leader>mn"] = { "<CMD>call codeium#CycleCompletions(1)<CR>", "Cycle to the next Codeium sugestion", opts = silent },
        ["<leader>mp"] = { "<CMD>call codeium#CycleCompletions(-1)<CR>", "Cycle to the previous Codeium sugestion", opts = silent },
        ["<C-c>"] = { "<CMD>call codeium#Clear()<CR>", "Clear Codeium suggestion", opts = silent },
    },
    i = {
        ["<C-f>"] = { "<CMD>call codeium#CycleCompletions(1)<CR>", "Cycle to the next Codeium sugestion", opts = silent },
        ["<C-b>"] = { "<CMD>call codeium#CycleCompletions(-1)<CR>", "Cycle to the previous Codeium sugestion", opts = silent },
        ["<Tab>"] = { "codeium#Accept()", "Accept Codeium suggestion", opts = vim.tbl_extend("error", script, silent, nowait, expr) },
    },
}

M.hex = {
    n = {
        ["<leader>h"] = { "<CMD>HexToggle<CR>", "Toggle hex view", opts = silent },
    }
}

M.deepl = {
    v = {
        ["<leader>tr2en"] = { '<CMD>call deepl#v("EN")<CR>', "Translate to English", opt = silent },
        ["<leader>trdeen"] = { '<CMD>call deepl#v("EN", "DE")<CR>', "Translate from German to English", opt = silent },
        ["<leader>trtren"] = { '<CMD>call deepl#v("EN", "TR")<CR>', "Translate from Turkish to English", opt = silent },
        ["<leader>tr2de"] = { '<CMD>call deepl#v("DE")<CR>', "Translate to German", opt = silent },
        ["<leader>trende"] = { '<CMD>call deepl#v("DE", "EN")<CR>', "Translate from English to German", opt = silent },
        ["<leader>trtrde"] = { '<CMD>call deepl#v("DE", "TR")<CR>', "Translate from Turkish to German", opt = silent },
        ["<leader>tr2tr"] = { '<CMD>call deepl#v("TR")<CR>', "Translate to Turkish", opt = silent },
        ["<leader>trentr"] = { '<CMD>call deepl#v("TR", "EN")<CR>', "Translate from English to Turkish", opt = silent },
        ["<leader>trdetr"] = { '<CMD>call deepl#v("TR", "DE")<CR>', "Translate from German to Turkish", opt = silent },
    }
}

M.firenvim = {
    n = {
        ["<leader>cfni"] = { "<CMD>call firenvim#install(0)<CR>", "Install FireNvim bridge" },
    }
}

return M
