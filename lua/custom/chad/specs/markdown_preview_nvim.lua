local compat = require("custom.compat")

local M = { "iamcco/markdown-preview.nvim" }

M.name = "markdown_preview_nvim"
M.lazy = true
M.cond = not compat
-- M.dependencies = {}

M.init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_auto_close = 0
end

M.build = "cd app && yarn install"

-- M.branch = ""

-- M.event = {}
-- M.cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" }
M.ft = { "markdown" }
-- M.keys = {}

-- M.priority = 50

return M
