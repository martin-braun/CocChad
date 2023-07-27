local M = require("custom.chad.specs._stock")

local specs = {
    "auto_dark_mode",
    "coc_nvim",
    "codeium_vim",
    "deepl_vim",
    "hex_nvim",
    "nvim_dap",
    "nvim_dap_ui",
    "nvim_dap_virtual_text",
    "nvim_treesitter_context",
    "telescope_dap_nvim",
    "vim_blade",
    "vim_arduino",
    "firenvim",
}

for _ , spec in ipairs( specs  )  do
   table.insert(M, require("custom.chad.specs." .. spec))
end

-- CoC Plugins
vim.g.coc_global_extensions = {
    'coc-blade',
    'coc-css',
    'coc-deno',
    'coc-clangd',
    'coc-emmet',
    'coc-eslint',
    'coc-flutter-tools',
    'coc-highlight',
    'coc-html',
    'coc-java',
    'coc-json',
    'coc-lua',
    'coc-pairs',
    'coc-phpls',
    'coc-prettier',
    'coc-pyright',
    'coc-rust-analyzer',
    'coc-sh',
    'coc-snippets',
    'coc-svg',
    'coc-tailwindcss',
    'coc-tsserver',
    'coc-vimlsp',
    'coc-xml',
    'coc-yaml',
}

return M

