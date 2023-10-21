-- Code
vim.api.nvim_create_user_command(
'Code',
function(_)
    vim.cmd('wall')
    vim.cmd('mks!')
    local r, c = unpack(vim.api.nvim_win_get_cursor(0))
    local g = vim.fn.expand('%') .. ':' .. r .. ':' .. c
    vim.cmd('!codium . && codium -g ' .. g .. ' || code . && code -g ' .. g)
    vim.cmd('q!')
end,
{ nargs = 0, bang = false }
)
