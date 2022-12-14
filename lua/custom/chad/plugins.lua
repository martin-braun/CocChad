-- Neovim Plugins
local M = vim.tbl_extend("force", require("custom.chad.plugins._stock"), {
    ["f-person/auto-dark-mode.nvim"] = require("custom.chad.plugins.auto_dark_mode"),
    ["nvim-treesitter/nvim-treesitter-context"] = require("custom.chad.plugins.nvim_treesitter_context"),
    ["sheerun/vim-polyglot"] = require("custom.chad.plugins.vim_polyglot"),
    ["neoclide/coc.nvim"] = require("custom.chad.plugins.coc_nvim"),
    ["mfussenegger/nvim-dap"] = require("custom.chad.plugins.nvim_dap"),
    ["rcarriga/nvim-dap-ui"] = require("custom.chad.plugins.nvim_dap_ui"),
    ["nvim-telescope/telescope-dap.nvim"] = require("custom.chad.plugins.telescope_dap_nvim"),
    ["theHamsta/nvim-dap-virtual-text"] = require("custom.chad.plugins.nvim_dap_virtual_text"),
})

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

