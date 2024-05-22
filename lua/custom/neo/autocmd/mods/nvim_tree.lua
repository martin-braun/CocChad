-- auto opens NvimTree when entering a buffer, fixes Session reloading with empty NvimTree buffer
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    pattern = 'NvimTree*',
    callback = function()
        vim.cmd('NvimTreeOpen')
    end,
})
