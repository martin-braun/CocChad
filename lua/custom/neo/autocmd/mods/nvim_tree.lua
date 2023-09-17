vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    pattern = 'NvimTree*',
    callback = function()
        vim.cmd('NvimTreeOpen')
    end,
})
