-- Grep
vim.api.nvim_create_user_command(
'Grep',
function(opts)
    if vim.g.vscode then
        if not opts.bang then
            vim.cmd('VSCodeCall("workbench.action.findInFiles")')
            return
        end
        vim.cmd('VSCodeCall("workbench.action.replaceInFiles")')
        return
    end
    local usage = "Usage: :Grep <regex> <filter?>, i.e. :Grep /my_string/g **/*, or :Grep! s/my_string/my_replacement/g **/*"
    if not opts.args or string.len(opts.args) < 1 then
        print(usage)
        return
    end
    local delim = string.sub(opts.args, 1, 1)
    if delim == "s" then
        delim = string.sub(opts.args, 2, 2)
    end
    local pargs = vim.split(opts.args, delim)
    if #pargs < 3 then
        print(usage)
        return
    end
    local searchpatt = pargs[2]
    if pargs[1] == "s" and #pargs < 4 then
        print(usage)
        return
    end
    local replpatt = nil
    local flags = nil
    local filter = ""
    if pargs[1] == "s" then
        if not opts.bang then
            print(usage)
            return
        end
        replpatt = pargs[3]
        local bridge = vim.split(pargs[4], " ")
        flags = bridge[1]
        filter = bridge[2] or ""
        for i = 5, #pargs do
            filter = filter .. delim.. pargs[i]
        end
    else
        if opts.bang then
            print(usage)
            return
        end
        local bridge = vim.split(pargs[3], " ")
        flags = bridge[1]
        filter = bridge[2] or ""
        for i = 4, #pargs do
            filter = filter .. delim .. pargs[i]
        end
    end
    -- print("d:" .. delim .. "\ns:" .. searchpatt .. "\nr:" .. (replpatt or "nil") .. "\nm:" .. flags .. "\nf:" .. filter)
    if searchpatt and flags and filter then
        vim.cmd(":vimgrep /" .. searchpatt .. "/" .. flags .. "j " .. filter)
        vim.cmd(":cw")
        vim.cmd(":.cc")
        if replpatt then
            vim.cmd(":cfdo %s/" .. searchpatt .. "/" .. replpatt .. "/" .. flags .. "e")
        end
    end
end,
{ nargs = '*', bang = true }
)

