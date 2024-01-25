--vim.cmd('autocmd!') -- remove ALL autocommands for the current group

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.timeoutlen = 750
vim.opt.title = true
vim.opt.laststatus = 2
vim.opt.mouse = "c"
vim.opt.backup = false
vim.opt.shell = io.popen('command -v bash 2>/dev/null'):read()
vim.opt.backupskip = '/tmp/*,/private/tmp/*,/private/var/tmp/*,/usr/local/var/tmp/*,/var/folders/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 8
vim.opt.ai = true -- auto indent
vim.opt.si = true -- smart indent
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- finding files recursively
vim.opt.wildignore:append { '*/node_modules/*' }

-- undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

vim.opt.formatoptions:append { 'r' }

vim.opt.clipboard:append { 'unnamed', 'unnamedplus' } -- use system clipboard
vim.cmd("nunmap Y") -- revert capital y to full line copy to fully mimic vim, use y$ instead
