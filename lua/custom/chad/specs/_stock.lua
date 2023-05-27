return {
    { "NvChad/nvterm", enabled = false }, -- use tmux for additional shells
    {
        "NvChad/nvim-colorizer.lua",
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
    { 
        "nvim-treesitter/nvim-treesitter", 
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "c",
                "markdown",
                "markdown_inline",
            },
            indent = {
                enable = true,
                -- disable = {
                --   "python"
                -- },
            },
        }
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            git = {
                enable = true,
            },
            view = {
                adaptive_size = true,
                mappings = {
                    list = {
                        { key = "+", action = "cd" }, -- move down with +, because move up is triggered by -
                        { key = "<C-e>", action = nil } -- undo edit in place
                    }
                }
            },
            renderer = {
                symlink_destination = false,
                highlight_git = true,
                icons = {
                    show = {
                        git = true,
                    },
                },
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
        }
    },
    {
        "nvim-telescope/telescope.nvim",
        opts = {
            defaults = {
                layout_strategy = "vertical",
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
        opts = {
            keys = { "<leader>", '"', "'", "`" }
        }
    },
}

