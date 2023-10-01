local M = require("custom.chad.specs._stock")

local specs = {
    "auto_dark_mode",
    "coc_nvim",
    "codeium_vim",
    "deepl_vim",
    "firenvim",
    "hex_nvim",
    "nvim_dap",
    "nvim_dap_ui",
    "nvim_dap_virtual_text",
    "nvim_treesitter_context",
    "telescope_dap_nvim",
    "vim_blade",
    "vim_arduino",
    "vim_log_highlighting",
}

for _ , spec in ipairs( specs  )  do
   table.insert(M, require("custom.chad.specs." .. spec))
end

-- CoC Plugins
vim.g.coc_global_extensions = {
    'coc-blade',
    'coc-css',
    'coc-clangd',
    'coc-deno',
    'coc-emmet',
    'coc-eslint',
    'coc-flutter-tools',
    'coc-highlight',
    'coc-html',
    'coc-java',
    'coc-json',
    'coc-lua',
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

-- alternative to clang in coc-settings.json:
-- "languageserver": {
--   "ccls": {
--     "command": "ccls",
--     "filetypes": ["c", "cc", "cpp", "c++", "objc", "objcpp"],
--     "rootPatterns": [".ccls", "compile_commands.json", ".git/", ".hg/"],
--     "initializationOptions": {
--       "cache": {
--         "directory": "/tmp/ccls"
--       }
--     }
--   },
-- }

return M

