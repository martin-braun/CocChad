local M = {}

local silent = { silent = true }
local nowait = { nowait = true }
local noremap = { noremap = true }
local expr = { expr = true }
local noreplace_keycodes = { replace_keycodes = false }

M.disabled = {
    n = {
        ["<TAB>"] = "", -- undo buffer navigation
        ["<S-Tab>"] = "", -- undo buffer navigation
        ["<Right>"] = "", -- undo special navigation rules using arrow keys
        ["<Down>"] = "", -- undo special navigation rules using arrow keys
        ["<Up>"] = "", -- undo special navigation rules using arrow keys
        ["<Left>"] = "", -- undo special navigation rules using arrow keys
        ["j"] = "", -- undo navigating through wrapped text, use gj instead
        ["k"] = "", -- undo navigating through wrapped text, use gk instead
        ["<C-g>"] = "", -- undo file info
        ["<C-h>"] = "", -- undo quick window jump, prefix with ^W instead
        ["<C-j>"] = "", -- undo quick window jump, prefix with ^W instead
        ["<C-k>"] = "", -- undo quick window jump, prefix with ^W instead
        ["<C-l>"] = "", -- undo quick window jump, prefix with ^W instead
        ["<leader>b"] = "", -- undo <leader>b new buffer, use C-n instead
        ["<leader>x"] = "", -- undo <leader>x close buffer, use <leader>c instead
        ["<leader>tk"] = "", -- undo find keys with telescope, use <leader>fk instead
        ["<leader>cm"] = "", -- undo git commits, use <leader>fg
        ["<leader>cc"] = "", -- undo jump to current context
        ["<leader>gt"] = "", -- undo git status, use <C-g> instead
        ["<leader>rn"] = "", -- undo toggle relative numbers, keep it as it is
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
        ["<leader>fi"] = { "mqgg=G`qzz", "fix indentions" },
        ["<C-s>"] = { "<CMD>w<CR>", "save" },
        ["<leader>ss"] = { "<CMD>wall<CR>", "save all", opts = nowait },
        ["<leader>ti"] = { "a<C-r>=strftime('%y-%m-%d %H:%M:%S')<C-m><C-c>", "insert time", opts = nowait },
        ["<leader>ts"] = { "a<C-r>=strftime('%y%m%d_%H%M%S')<C-m><C-c>", "insert timestamp", opts = nowait },
        ["<C-n>"] = { "<CMD>enew<CR>", "new buffer" },
        ["<C-w>+"] = { "8<C-w>+", "grow window horizontally" },
        ["<C-w>-"] = { "8<C-w>-", "shrink window horizontally" },
        ["<C-w>|"] = { "32<C-w>|", "minimize window horizontally" },
        ["<C-w>>"] = { "8<C-w>>", "grow window vertically" },
        ["<C-w><"] = { "8<C-w><", "shrink window vertically" },
        ["<C-w>_"] = { "8<C-w>_", "minimize window vertically" },
    },
    i = {
        ["<C-s>"] = { "<CMD>w <CR>", "save" },
    },
    v = {
        ["<leader>fi"] = { "mqgg=G`qzz", "fix indentions" },
        ["<C-s>"] = { "<CMD>w <CR>", "save" },
        ["<leader>ss"] = { "<CMD>wall <CR>", "save all" },
        ["<leader>ti"] = { "c<C-r>=strftime('%Y-%m-%d %H:%M:%S')<C-m><C-c>", "insert time" },
        ["<leader>ts"] = { "c<C-r>=strftime('%Y%m%d_%H%M%S')<C-m><C-c>", "insert timestamp" },
    },
}

M.telescope = {
    n = {
        ["<CR>"] = { "<CMD>Telescope <CR>", "open Telescope" },
        ["<C-p>"] = { "<CMD>Telescope find_files <CR>", "find files" },
        ["<C-_>"] = { "<CMD>Telescope live_grep <CR>", "live grep" }, -- CTRL+7
        ["<leader>fk"] = { "<CMD>Telescope keymaps <CR>", "show keys" },
        ["<leader>fg"] = { "<CMD>Telescope git_commits <CR>", "git commits" },
        ["<C-g>"] = { "<CMD>Telescope git_status <CR>", "git status" },
    },
}

M.nvimtree = {
    n = {
        ["<C-e>"] = { "<CMD>NvimTreeToggle <CR>", "toggle nvimtree" },
    },
}

M.tabufline = {
    n = {
        ["<C-j>"] = {
            function()
                require("nvchad_ui.tabufline").tabuflineNext()
            end, "goto next buffer", opts = silent
        },
        ["<leader>j"] = { "<CMD>TbufRight<CR>", "move buffer forward" },
        ["<C-k>"] = {
            function()
                require("nvchad_ui.tabufline").tabuflinePrev()
            end,
            "goto prev buffer", opts = silent
        },
        ["<leader>k"] = { "<CMD>TbufLeft<CR>", "move buffer backward" },
        ["<leader>c"] = {
            function()
                require("nvchad_ui.tabufline").close_buffer()
            end,
            "close buffer", opts = silent
        },
        -- ["<leader>cc"] = {
        --     function()
        --         pcall(function ()
        --             vim.cmd("update")
        --         end)
        --         require("nvchad_ui.tabufline").close_buffer()
        --     end,
        --     "update and close buffer",
        -- },
        -- ["<leader>x"] = { "<CMD>q<CR>", "close window" },
    },
}

M.coc = {
    n = {
        ["<leader>ff"] = { "<CMD>Format<CR>", "format code" },
        ["<leader>FF"] = { "<CMD>Format<CR><CMD>w<CR>", "format code and save" },
        ["<C-d>"] = { 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', "scroll down", opts = vim.tbl_extend("error", silent, nowait, expr) },
        ["<C-u>"] = { 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', "scroll up", opts = vim.tbl_extend("error", silent, nowait, expr) },
        ["<leader>[]"] = { ':<C-u>CocList diagnostics<CR>', "show all diagnostics", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>x"] = { ':<C-u>CocList extensions<CR>', "manage extensions", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>y"] = { ':<C-u>CocList commands<CR>', "show commands", opts = vim.tbl_extend("error", silent, nowait) },
        ["gs"] = { ':<C-u>CocList outline<CR>', "goto the symbol of the current file", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>fs"] = { ':<C-u>CocList -I symbols<CR>', "find symbols", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>j"] = { ':<C-u>CocNext<CR>', "do default action for next item", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>k"] = { ':<C-u>CocPrev<CR>', "do default action for previous item", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>r"] = { ':<C-u>CocListResume<CR>', "resume latest coc list", opts = vim.tbl_extend("error", silent, nowait) },
        ["[]g"] = { "<CMD>CocDiagnostics<CR>", "show diagnostics" },
        ["[g"] = { "<Plug>(coc-diagnostic-prev)", "navigate to previous diagnostic", opts = silent },
        ["]g"] = { "<Plug>(coc-diagnostic-next)", "navigate to next diagnostic", opts = silent },
        ["gd"] = { "<Plug>(coc-definition)", "goto definition", opts = silent },
        ["gt"] = { "<Plug>(coc-type-definition)", "goto type definition", opts = silent },
        ["gi"] = { "<Plug>(coc-implementation)", "goto implementation", opts = silent },
        ["gr"] = { "<Plug>(coc-references)", "goto references", opts = silent },
        ["K"] = { '<CMD>lua _G.show_docs()<CR>', "show documentation" },
        ["<leader>rn"] = { '<Plug>(coc-rename)', "refactor rename symbol", opts = silent },
        ["<leader>rf"] = { '<CMD>CocCommand workspace.renameCurrentFile<CR>', "refactor rename file", opts = silent },
        ["<leader>a"] = { '<Plug>(coc-codeaction-selected)', "add codeaction to selected region", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>ag"] = { '<Plug>(coc-codeaction)', "apply code action to current buffer", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>fl"] = { '<Plug>(coc-fix-current)', "autofix current line", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>ll"] = { '<Plug>(coc-codelens-action)', "perform CodeLens action on the current line", opts = vim.tbl_extend("error", silent, nowait) },
        ["<C-y>"] = { '<Plug>(coc-range-select)', "select ranges", opts = silent },
        ["<leader>uc"] = { '<CMD>CocUpdate<CR>', "update coc extensions" },

        -- coc-flutter
        ["<leader>sfe"] = { '<CMD>CocList FlutterEmulators<CR>', "launch Flutter emulator", opts = silent },
        ["<leader>sfE"] = { ':call jobstart("emulator @flutter_emulator -no-snapshot-load")<CR>', "cold start flutter_emulator", opts = silent },
        ["<leader>sfd"] = { '<CMD>CocList FlutterDevices<CR>', "select Flutter device target", opts = silent },
        ["<leader>sfs"] = { '<CMD>CocList FlutterSDKs<CR>', "select Flutter SDK", opts = silent },
        ["<leader>sfr"] = { '<CMD>CocCommand flutter.run<CR><CMD>CocCommand flutter.dev.hotReload<CR>', "run / hot reload Flutter app on device/emulator", silent },
        ["<leader>sfD"] = { '<CMD>CocCommand flutter.doctor<CR>', "run Flutter doctor" },
        ["<leader>sfpg"] = { '<CMD>CocCommand flutter.pub.get<CR>', "run Flutter Pub Get" },
        ["<leader>sfq"] = { '<CMD>CocCommand flutter.dev.quit<CR>', "quit Flutter dev server" },
        ["<leader>sfR"] = { '<CMD>CocCommand flutter.dev.hotRestart<CR>', "hot restart Flutter dev server" },
        ["<leader>sfl"] = { '<CMD>CocCommand flutter.dev.openDevLog<CR>', "show Flutter dev log" },
        ["<leader>sfc"] = { '<CMD>CocCommand flutter.dev.clearDevLog<CR>', "clear Flutter dev server log" },
        ["<leader>sfp"] = { '<CMD>CocCommand flutter.dev.showPerformanceOverlay<CR>', "show Flutter dev server performance overlay" },
        ["<leader>sft"] = { '<CMD>new | r ! fvm flutter pub deps<CR>', "show Flutter dependency tree" },

        -- coc-deno
        ["<leader>sdc"] = { '<CMD>CocCommand deno.cache<CR>', "cache Deno dependencies" },
        ["<leader>sds"] = { '<CMD>CocCommand deno.status<CR>', "show Deno language server status" },
        ["<leader>sdt"] = { '<CMD>CocCommand deno.task<CR>', "show/run Deno tasks" },
        ["<leader>sdp"] = { '<CMD>CocCommand deno.performance<CR>', "display the timing averages for the internal Deno instrumentation" },
        ["<leader>sdi"] = { '<CMD>CocCommand deno.initializeWorkspace<CR>', "Initialize Deno workspace configuration" },

        --coc-blade
        ["<leader>sbo"] = { '<CMD>CocCommand blade.showOutput<CR>', "show blade output channel", opts = silent },
        ["<leader>sbf"] = { '<CMD>CocCommand blade.bladeFormatter.run<CR>', "run blade-formatter", opts = silent },
    },
    i = {
        ["<C-d>"] = { 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', "scroll down", opts = vim.tbl_extend("error", silent, nowait, expr) },
        ["<C-u>"] = { 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', "scroll up", opts = vim.tbl_extend("error", silent, nowait, expr) },
        ["<C-n>"] = { 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<C-n>" : coc#refresh()', "move suggestion down / show suggestions", opts = vim.tbl_extend("error", silent, noremap, expr, noreplace_keycodes) },
        ["<Down>"] = { 'coc#pum#visible() ? coc#pum#next(1) : "<Down>"', "move suggestion down", opts = vim.tbl_extend("error", silent, noremap, expr, noreplace_keycodes) },
        ["<C-p>"] = { 'coc#pum#visible() ? coc#pum#prev(1) : "<C-p>"', "move suggestion up", opts = vim.tbl_extend("error", silent, noremap, expr, noreplace_keycodes) },
        ["<Up>"] = { 'coc#pum#visible() ? coc#pum#prev(1) : "<Up>"', "move suggestion up", opts = vim.tbl_extend("error", silent, noremap, expr, noreplace_keycodes) },
        ["<CR>"] = { 'coc#pum#visible() ? coc#pum#confirm() : "<CR>"', "confirm selection", opts = vim.tbl_extend("error", silent, noremap, expr, noreplace_keycodes) },
        ["<C-m>"] = { '<Plug>(coc-snippets-expand-jump)', "insert snippet" },
        ["<C-l>"] = { 'coc#refresh()', "show suggestions", opts = vim.tbl_extend("error", silent, expr) },
    },
    v = {
        ["<leader>ff"] = { ':call CocActionAsync("format")<CR>', "format code" },
        ["<leader>FF"] = { "<CMD>w<CR><CMD>Format<CR><CMD>w<CR>", "format code and save" },
        ["<C-d>"] = { 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', "scroll down", opts = vim.tbl_extend("error", silent, nowait, expr) },
        ["<C-u>"] = { 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', "scroll up", opts = vim.tbl_extend("error", silent, nowait, expr) },
    },
    x = {
        ["<leader>if"] = { '<Plug>(coc-funcobj-i)', "map insert function object", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>af"] = { '<Plug>(coc-funcobj-a)', "map append function object", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>ic"] = { '<Plug>(coc-classobj-i)', "map insert class object", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>ac"] = { '<Plug>(coc-classobj-a)', "map append class object", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>a"] = { '<Plug>(coc-codeaction-selected)', "add codeaction to selected region", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>rn"] = { '<Plug>(coc-rename)', "refactor rename symbol", opts = silent },
        ["<C-y>"] = { '<Plug>(coc-range-select)', "select ranges", opts = silent },
    },
    o = {
        ["<leader>if"] = { '<Plug>(coc-funcobj-i)', "map insert function object", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>af"] = { '<Plug>(coc-funcobj-a)', "map append function object", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>ic"] = { '<Plug>(coc-classobj-i)', "map insert class object", opts = vim.tbl_extend("error", silent, nowait) },
        ["<leader>ac"] = { '<Plug>(coc-classobj-a)', "map append class object", opts = vim.tbl_extend("error", silent, nowait) },
    },
}

M.dap = {
    n = {
        ["<F5>"] = { "<CMD>DapContinue<CR>", "start/continue debugging", opts = silent },
        ["<leader>pr"] = { "<CMD>DapContinue<CR>", "start/continue debugging", opts = silent },
        ["<leader>pR"] = { "<CMD>DapRestart<CR>", "restart debugging", opts = silent },
        ["<F10>"] = { "<CMD>DapStepOver<CR>", "step over next instruction while debugging", opts = silent },
        ["<leader>pn"] = { "<CMD>DapStepOver<CR>", "step over next instruction while debugging", opts = silent },
        ["<F11>"] = { "<CMD>DapStepInto<CR>", "step into next instruction while debugging", opts = silent },
        ["<leader>pi"] = { "<CMD>DapStepInto<CR>", "step into next instruction while debugging", opts = silent },
        ["<F12>"] = { "<CMD>DapStepOut<CR>", "step out of current scope while debugging", opts = silent },
        ["<S-F5>"] = { "<CMD>DapTerminate<CR>", "terminate debugging", opts = silent },
        ["<leader>pq"] = { "<CMD>DapTerminate<CR>", "terminate process while debugging", opts = silent },
        ["<leader>pc"] = { "<CMD>DapClose<CR>", "close process while debugging", opts = silent },
        ["<leader>po"] = { "<CMD>DapStepOut<CR>", "step out of current scope while debugging", opts = silent },
        ["<leader>pp"] = { "<CMD>DapStepBack<CR>", "step back to previous instruction while debugging", opts = silent },
        ["<leader>pP"] = { "<CMD>DapPause<CR>", "pause debugger while debugging", opts = silent },
        ["<leader>pg"] = { "<CMD>DapGotoCurrentLine<CR>", "go to current liner while debugging", opts = silent },
        ["<leader>pbb"] = { "<CMD>DapToggleBreakpoint<CR>", "toggle breakpoint", opts = silent },
        ["<leader>pbc"] = { "<CMD>DapSetConditionalBreakpoint<CR>", "set breakpoint with condition" },
        ["<leader>pbB"] = { "<CMD>DapSetLogBreakpoint<CR>", "set breakpoint with log point message" },
        ["<leader>pbl"] = { "<CMD>DapListBreakpoints<CR>", "list breakpoints" },
        ["<leader>pbx"] = { "<CMD>DapClearBreakpoints<CR>", "clear breakpoints", opts = silent },
        ["<leader>pe"] = { "<CMD>DapToggleMiniRepl<CR>", "toggle repl environment", opts = silent },
        ["<leader>pl"] = { "<CMD>DapShowMiniLog<CR>", "show dap log", opts = silent },
        ["<leader>pu"] = { "<CMD>DapUiToggle<CR>", "toggle dap ui", opts = silent },
        ["<leader>pf"] = { "<CMD>DapUiFloatElement<CR>", "open floated element", opts = silent },
        ["<leader>pE"] = { "<CMD>DapUiEval<CR>", "evaludate selected expression while debugging", opts = silent },
    }
}

return M

