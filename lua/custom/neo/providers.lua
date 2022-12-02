vim.g.loaded_python3_provider = nil
vim.g.python3_host_prog = "/usr/local/bin/python3"

vim.g.loaded_ruby_provider = nil
vim.g.ruby_host_prog = require("custom.lib.rbenv").ruby_global_path() .. "/bin/neovim-ruby-host"

-- vim.g.loaded_perl_provider = nil
-- vim.g.perl_host_prog = "/usr/bin/perl"

vim.g.loaded_node_provider = nil
vim.g.node_host_prog = require("custom.lib.nvm").node_lts_path() .. "/bin/neovim-node-host"
vim.g.coc_node_path = require("custom.lib.nvm").node_lts_path() .. "/bin/node"
-- please use lts/* as default (nvm alias default 'lts/*') to use the LTS version as Neovim node.js provider binary as well (recommend)

