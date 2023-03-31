local M = {}

vim.g['deepl#endpoint'] = "https://api-free.deepl.com/v2/translate"
vim.g['deepl#auth_key'] = os.getenv("DEEPL_AUTH_KEY")

M.setup = function()
end

M.config = function()
end

return M

