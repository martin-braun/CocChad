local M = { "ryicoh/deepl.vim" }

M.name = "deepl_vim"
M.lazy = true
M.cond = true
-- M.dependencies = {}

M.init = function()
end

M.config = function()
  vim.g['deepl#endpoint'] = "https://api-free.deepl.com/v2/translate"
  vim.g['deepl#auth_key'] = os.getenv("DEEPL_AUTH_KEY")
end

-- M.branch = ""

-- M.event = {}
-- M.cmd = {}
-- M.ft = {}
M.keys = {
    { "<leader>tr", mode = 'n' },
    { "<leader>tr", mode = 'x' },
}

-- M.priority = 50

return M

