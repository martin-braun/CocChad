local compat = require("custom.compat")

local layout_strategies = require("telescope.pickers.layout_strategies")
layout_strategies.dynamic = function(self, max_columns, max_lines, layout_config)
    if vim.o.columns > 120 then
        return layout_strategies.horizontal(self, max_columns, max_lines, layout_config)
    else
        return layout_strategies.vertical(self, max_columns, max_lines, layout_config)
    end
end

return {
    { "NvChad/ui", enabled = true, cond = not compat },
    { "NvChad/base46", enabled = true, cond = not compat },
    { "NvChad/nvterm", enabled = false }, -- use tmux for additional shells
    {
        "NvChad/nvim-colorizer.lua",
        enabled = true,
        cond = not compat,
        opts = {
            user_default_options = {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                names = true, -- "Name" codes like Blue
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true, -- CSS rgb() and rgba() functions
                hsl_fn = true, -- CSS hsl() and hsla() functions
                css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
                mode = "background", -- Set the display mode.
            },
        }
    },
    { "williamboman/mason.nvim", enabled = false }, -- use coc.nvim instead
    { "neovim/nvim-lspconfig", enabled = false }, -- use coc.nvim instead
    { "rafamadriz/friendly-snippets", enabled = false }, -- use coc.nvim instead
    { "hrsh7th/nvim-cmp", enabled = false }, -- use coc.nvim instead
    { "L3MON4D3/LuaSnip", enabled = false }, -- use coc.nvim instead
    { "saadparwaiz1/cmp_luasnip", enabled = false }, -- use coc.nvim instead
    { "hrsh7th/cmp-nvim-lua", enabled = false }, -- use coc.nvim instead
    { "hrsh7th/cmp-nvim-lsp", enabled = false }, -- use coc.nvim instead
    { "hrsh7th/cmp-buffer", enabled = false }, -- use coc.nvim instead
    { "hrsh7th/cmp-path", enabled = false }; -- use coc.nvim instead
    { "windwp/nvim-autopairs", enabled = false }, -- use coc.nvim instead
    { "nvim-treesitter/nvim-treesitter", enabled = false, }, -- use coc.nvim instead
    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = true,
        cond = not compat,
        opts = {
            show_current_context = false,
            show_current_context_start = false,
        }
    },
    {
        "nvim-tree/nvim-tree.lua",
        enabled = true,
        cond = not compat,
        opts = {
            view = {
                adaptive_size = true,
                relativenumber = true,
            },
            renderer = {
                highlight_git = false,
                icons = {
                    webdev_colors = false,
                    git_placement = "after",
                    show = {
                        git = true,
                    },
                    glyphs = {
                        git = {
                            unstaged = "󰝶",
                            staged = "󰛿",
                            unmerged = "",
                            renamed = "󱞇",
                            untracked = "★",
                            deleted = "󱟃",
                            ignored = "",
                        },
                    },
                },
                special_files = {
                    "README.md",
                    "readme.md",
                    "CONTRIBUTING.md",
                    "contributing.md",
                },
                symlink_destination = false,
            },
            git = {
                enable = true,
                ignore = false,
            },
            filters = {
                custom = {
                    "^\\.git$",
                    "^\\.svg$",
                    "^\\.hg$",
                    "^CVS$",
                    "^\\.DS_Store$",
                    "^\\.Thumbs.db$",
                    "Desktop\\.ini$",
                    "Session\\.vim$",
                },
            },
            on_attach = function(bufnr)
                local api = require('nvim-tree.api')

                local function opts(desc)
                    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                -- Default mappings. Feel free to modify or remove as you wish.
                --
                -- BEGIN_DEFAULT_ON_ATTACH
                vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
                -- vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
                vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
                vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
                vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
                vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
                vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
                vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
                vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
                vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
                vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
                vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
                vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))
                vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
                vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
                vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
                vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
                vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
                vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
                vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
                vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
                vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
                vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'))
                vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
                vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
                vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
                vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
                vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
                vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))
                vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
                vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
                vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
                vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
                vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
                vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
                vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
                vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
                vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
                vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
                vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
                vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
                vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
                vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
                vim.keymap.set('n', 's',     api.node.run.system,                   opts('Run System'))
                vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))
                vim.keymap.set('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
                vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
                vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
                vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
                vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
                vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
                vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
                -- END_DEFAULT_ON_ATTACH

                -- Mappings migrated from view.mappings.list
                --
                -- You will need to insert "your code goes here" for any mappings with a custom action_cb
                vim.keymap.set('n', 'e', api.node.open.edit, opts('Open'))
                vim.keymap.set('n', 'l', api.node.open.preview, opts('Open Preview'))
                vim.keymap.set('n', '+', api.tree.change_root_to_node, opts('CD'))

            end,
            ui = {
                confirm = {
                    trash = false
                }
            },
            -- log = {
            --     enable = true,
            --     truncate = true,
            --     types = {
            --         diagnostics = false,
            --         git = false,
            --         profile = false,
            --         watcher = false,
            --         dev = true,
            --     },
            -- },
        },
        lazy = false,
        priority = 5000,
    },
    {
        "nvim-telescope/telescope.nvim",
        enabled = true,
        cond = not compat,
        opts = {
            defaults = {
                file_ignore_patterns = {
                    ".git/",
                    "node_modules",
                    "__pycache__",
                    "venv",
                },
                layout_strategy = "dynamic",
                layout_config = {
                    height = 0.95,
                    prompt_position = "top",
                    vertical = {
                        mirror = true,
                        preview_cutoff = 0,
                    },
                },
            },
        }
    },
    {
        "folke/which-key.nvim",
        enabled = true,
        cond = not compat,
        opts = {
            keys = { "<leader>", '"', "'", "`" }
        }
    },
}

