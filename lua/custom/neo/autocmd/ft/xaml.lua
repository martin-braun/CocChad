vim.api.nvim_create_autocmd({"BufNewFile", "BufRead", "BufEnter"},{
    pattern = {"*.xaml"},
    command = "setf xml"
})

