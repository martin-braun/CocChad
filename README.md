# CocChad

My NvChad customs for coc.nvim, nvim-dap, VSCode, FireNvim etc.

This configuration is meant to be installed on top of Neovim. It installs NvChad, but focuses on reverting some original behavior of Neovim as well as providing a `coc.nvim` configuration with many language servers out of the box. It also comes with `nvim-dap` and some extensions for some languages to give debugging support right out-of-the-box.

This configuration also enables Neovim to be used in compat mode with VSCode and FireNvim.

## Installation

After installing Neovim, please fork this repository to allow further customization, then: 

- Pull your fork in a local working directory
- Backup all your nvim data, the next step will remove it to link a new custom and ftplugin folder
- Run `./link` (will reset all your nvim data)

Please read the script before running it! I'm not responsible for any damage. This repository is primary for me to backing up my personal custom configuration for NvChad, but maybe it is beneficial to you.

## Compats (embedded Neovim)

### VSCode

This configuration is compatible with [vscode-neovim/vscode-neovim](https://github.com/vscode-neovim/vscode-neovim), but it recommends you to use [these keybindings](.vscode/keybindings.sample.json) and [these settings](.vscode/settings.sample.json) in VSCode to make all work properly.

Please checkout the [recommend extensions](.vscode/extensions.json) as well.

### FireNvim

This configuration is compatible with [glacambre/firenvim](https://github.com/glacambre/firenvim), load the plugin and install the browser bridge via `<leader>cfni` in a normal terminal session. To transform a textarea to a Neovim window, you have to trigger it with (cmd+e / ctrl+e).
