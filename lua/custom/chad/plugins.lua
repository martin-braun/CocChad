-- Neovim Plugins
local M = vim.tbl_extend("force", require("custom.chad.specs._stock"), {
    require("custom.chad.specs.auto_dark_mode"),
    require("custom.chad.specs.coc_nvim"),
    require("custom.chad.specs.codeium_vim"),
    require("custom.chad.specs.deepl_vim"),
    require("custom.chad.specs.hex_nvim"),
    require("custom.chad.specs.nvim_dap"),
    require("custom.chad.specs.nvim_dap_ui"),
    require("custom.chad.specs.nvim_dap_virtual_text"),
    require("custom.chad.specs.nvim_treesitter_context"),
    require("custom.chad.specs.telescope_dap_nvim"),
    require("custom.chad.specs.vim_blade"),
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
    'coc-yaml',
    'coc-emmet',
    'coc-tailwindcss',
    'coc-vimlsp',
    'coc-xml',
    'coc-html',
    'coc-svg',
    'coc-css',
    'coc-pyright',
    'coc-highlight',
    'coc-rust-analyzer',
    'coc-lua',
    'coc-java',
    'coc-deno',
    'coc-flutter',
    'coc-phpls',
    'coc-blade',
}

return M

