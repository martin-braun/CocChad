vim.api.nvim_create_autocmd({"BufNewFile", "BufRead", "BufEnter"},{
    pattern = {"*.reg"},
    command = "setf ini"
})

