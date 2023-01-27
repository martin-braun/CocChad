return {
    ["NvChad/ui"] = {
        override_options = function()
            return {
                statusline = {
                    separator_style = "arrow", -- default/round/block/arrow
                    overriden_modules = function()
                        return {
                            fileInfo = function() -- Enable laststatus 2 support
                                local icon = "" --  /  / █ / 
                                local filename = (vim.fn.expand "%" == "" and " Empty") or " %t "
                                return "%#St_file_info#" .. filename .. "%#St_file_sep#" .. icon .. " "
                            end,
                        }
                    end,
                },
                tabufline = {
                    overriden_modules = function()
                        return {
                            buttons = function() -- hide buttons
                                return ""
                            end,
                        }
                    end,
                }
            }
        end,
    },
    ["NvChad/nvterm"] = false, -- use tmux for additional shells
    ["NvChad/nvim-colorizer.lua"] = {
        override_options = function()
            return {
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
        end,
    },
    ["williamboman/mason.nvim"] = false, -- use coc.nvim instead
    ["neovim/nvim-lspconfig"] = false, -- use coc.nvim instead
    ["rafamadriz/friendly-snippets"] = false, -- use coc.nvim instead
    ["hrsh7th/nvim-cmp"] = false, -- use coc.nvim instead
    ["L3MON4D3/LuaSnip"] = false, -- use coc.nvim instead
    ["saadparwaiz1/cmp_luasnip"] = false, -- use coc.nvim instead
    ["hrsh7th/cmp-nvim-lua"] = false, -- use coc.nvim instead
    ["hrsh7th/cmp-nvim-lsp"] = false, -- use coc.nvim instead
    ["hrsh7th/cmp-buffer"] = false, -- use coc.nvim instead
    ["hrsh7th/cmp-path"] = false; -- use coc.nvim instead
    ["windwp/nvim-autopairs"] = false, -- use coc.nvim instead
    ["kyazdani42/nvim-tree.lua"] = {
        override_options = function()
            return {
                open_on_setup = true,
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
                },
            }
        end,
    },
    ["nvim-telescope/telescope.nvim"] = {
        override_options = function()
            return {
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
        end,
    },
    ["folke/which-key.nvim"] = {
        disable = false,
        override_options = function()
            return {
                keys = { "<leader>", '"', "'", "`" }
            }
        end,
    },
}

