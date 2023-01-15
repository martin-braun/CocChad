local cmd = require("custom.lib.command")

vim.g.loaded_python3_provider = nil
vim.g.python3_host_prog = io.popen("command -v python3 2>/dev/null"):read()

vim.g.loaded_ruby_provider = nil
vim.g.ruby_host_prog = cmd.resolved_invoker_of("neovim-ruby-host")

-- vim.g.loaded_perl_provider = nil
-- vim.g.perl_host_prog = "/usr/bin/perl"

-- please use lts/* as default (nvm alias default 'lts/*') or install lts system node (nvm alias default system) to use the LTS version as Neovim node.js provider binary as well (recommend)
vim.g.loaded_node_provider = nil
local nvm = require("custom.lib.nvm")
if nvm.system_node_active then
    vim.g.node_host_prog = cmd.resolved_invoker_of("neovim-node-host")
    vim.g.coc_node_path = cmd.resolved_invoker_of("node")

else
    print("2")
    vim.g.node_host_prog = nvm.node_lts_path() .. "/bin/neovim-node-host"
    vim.g.coc_node_path = nvm.node_lts_path() .. "/bin/node"
end

