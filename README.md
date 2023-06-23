# CocChad

My NvChad customs for coc.nvim, nvim-dap, etc.

This custom set is meant to be installed on top of NvChad. It focuses on reverting some original behavior of nvim as well as providing a `coc.nvim` configuration with many language servers out of the box. It also comes with `nvim-dap` and some extensions for some languages to give debugging support right out-of-the-box.

## Installation

After installing Neovim, please fork this repository to allow further customization, then: 

- Pull your fork in a local working directory
- Backup all your nvim data, the next step will remove it to link a new custom and ftplugin folder
- Run `./link` (will reset all your nvim data)

Please read the script before running it! I'm not responsible for any damage. This repository is primary for me to backing up my personal custom configuration for NvChad, but maybe it is beneficial to you.

## VSCode embedding

This configuration is compatible with [vscode-neovim/vscode-neovim](https://github.com/vscode-neovim/vscode-neovim#invoking-vscode-actions-from-neovim), but it recommends you to use [these keybindings](.vscode/keybindings.json) in VSCode to make all work properly.
