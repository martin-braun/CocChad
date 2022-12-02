-- Neovim Plugins
local M = {
    ["folke/which-key.nvim"] = require("custom.chad.plugins.which_key_nvim"),
    ["nvim-telescope/telescope.nvim"] = require("custom.chad.plugins.telescope_nvim"),
    ["NvChad/ui"] = require("custom.chad.plugins.ui"),
    ["kyazdani42/nvim-web-devicons"] = {},
    ["NvChad/nvterm"] = false, -- use native Terminal splits
    ["NvChad/nvim-colorizer.lua"] = require("custom.chad.plugins.nvim_colorizer_lua"),
    ["kyazdani42/nvim-tree.lua"] = require("custom.chad.plugins.nvim_tree_lua"),
    ["f-person/auto-dark-mode.nvim"] = require("custom.chad.plugins.auto_dark_mode"),
    ["nvim-treesitter/nvim-treesitter-context"] = require("custom.chad.plugins.nvim_treesitter_context"),
    ["sheerun/vim-polyglot"] = require("custom.chad.plugins.vim_polyglot"),
    -- ["hrsh7th/nvim-cmp"] = require("custom.chad.plugins.nvim_cmd"),
    -- ["neovim/nvim-lspconfig"] = require("custom.chad.plugins.lspconfig"),
    ["hrsh7th/nvim-cmp"] = false, -- use coc.nvim instead
    ["williamboman/mason.nvim"] = false, -- use coc.nvim instead
    ["neovim/nvim-lspconfig"] = false, -- use coc.nvim instead
    ["rafamadriz/friendly-snippets"] = false, -- use coc.nvim instead
    ["hrsh7th/cmp-nvim-lsp"] = false, -- use coc.nvim instead
    ["hrsh7th/cmp-nvim-lua"] = false, -- use coc.nvim instead
    ["hrsh7th/cmp-path"] = false; -- use coc.nvim instead
    ["hrsh7th/cmp-buffer"] = false, -- use coc.nvim instead
    ["L3MON4D3/LuaSnip"] = false, -- use coc.nvim instead
    ["saadparwaiz1/cmp_luasnip"] = false, -- use coc.nvim instead
    ["windwp/nvim-autopairs"] = false, -- use coc.nvim instead
    ["neoclide/coc.nvim"] = require("custom.chad.plugins.coc_nvim"),
}

-- CoC Plugins
vim.g.coc_global_extensions = {
    'coc-snippets',
    'coc-pairs',
    'coc-sh',
    'coc-prettier',
    'coc-tsserver',
    'coc-eslint',
    'coc-json',
    'coc-emmet',
    'coc-tailwindcss',
    'coc-vimlsp',
    'coc-xml',
    'coc-html',
    'coc-svg',
    'coc-css',
    'coc-pyright',
    'coc-highlight',
    'coc-rls',
    'coc-lua',
    'coc-java',
    'coc-deno',
    'coc-flutter',
    'coc-phpls',
    'coc-blade',
}

return M

