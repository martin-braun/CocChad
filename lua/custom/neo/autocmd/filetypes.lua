local FT = function()
    vim.filetype.add({
        extension = {
            arb = "json",
            ["code-snippets"] = "json",
            fvmrc = "json",
            log = "log",
            reg = "dosini",
            xaml = "xml",
        },
        filename = {
            ["playbook.yml"] = "yaml.ansible",
            ["requirements.yml"] = "yaml.ansible",
            [".dockerignore"] = "gitignore",
            [".stignore"] = "gitignore",
        },
        pattern = {
            ["%.env%..*"] = "sh",
            [".*/ansible/.*%.ya?ml"] = "yaml.ansible",
        },
    })
end

vim.api.nvim_create_autocmd({ 'BufReadPre' }, {
    callback = FT,
})
