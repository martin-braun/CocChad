vim.api.nvim_create_autocmd({"BufNewFile", "BufRead", "BufEnter"},{
    pattern = {"*.log"},
    command = "setf log"
})
