# CocChad

My NvChad customs for coc.nvim, nvim-dap, etc.

This custom set is meant to be installed on top of NvChad. It focuses on reverting some original behavior of nvim as well as providing a `coc.nvim` configuration with many language servers out of the box. It also comes with `nvim-dap` and some extensions for some languages to give debugging support right out-of-the-box.

## Installation

After installing Neovim + NvChad, please fork this repository to allow further customization, then: 

- Pull your fork in a local working directory
- Backup all your nvim data, the next step will remove it to link a new custom and ftplugin folder
- Run `./link` (will reset all your nvim data)

Please read the script before running it! I'm not responsible for any damage. This repository is primary for me to backing up my personal custom configuration for NvChad, but maybe it is beneficial to you.

## VSCode embedding

This configuration is compatible with [vscode-neovim/vscode-neovim](https://github.com/vscode-neovim/vscode-neovim#invoking-vscode-actions-from-neovim), but it recommends you to use these keybindings in VSCode to make all keymaps work properly: 

```json
[
    {
        "key": "ctrl+shift+s",
        "command": "workbench.action.files.saveAs"
    },
    {
        "key": "ctrl+shift+p",
        "command": "workbench.action.quickOpenNavigatePreviousInFilePicker",
        "when": "inFilesPicker && inQuickOpen"
    },
    {
        "key": "ctrl+shift+p",
        "command": "workbench.action.showCommands"
    },
    {
        "key": "ctrl+shift+p",
        "command": "workbench.action.quickOpenNavigatePreviousInFilePicker",
        "when": "inFilesPicker && inQuickOpen"
    },
    {
        "key": "shift+cmd+7",
        "command": "filesExplorer.findInFolder",
        "when": "explorerResourceIsFolder && filesExplorerFocus && foldersViewVisible && !inputFocus"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+q",
        "when": "editorTextFocus",
        "args": "<C-q>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+w",
        "when": "editorTextFocus",
        "args": "<C-w>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+e",
        "when": "editorTextFocus",
        "args": "<C-e>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+r",
        "when": "editorTextFocus",
        "args": "<C-r>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+t",
        "when": "editorTextFocus",
        "args": "<C-t>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+y",
        "when": "editorTextFocus",
        "args": "<C-y>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+i",
        "when": "editorTextFocus",
        "args": "<C-i>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+o",
        "when": "editorTextFocus",
        "args": "<C-o>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+p",
        "when": "editorTextFocus",
        "args": "<C-p>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+a",
        "when": "editorTextFocus",
        "args": "<C-a>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+s",
        "when": "editorTextFocus",
        "args": "<C-s>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+f",
        "when": "editorTextFocus",
        "args": "<C-f>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+g",
        "when": "editorTextFocus",
        "args": "<C-g>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+h",
        "when": "editorTextFocus",
        "args": "<C-h>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+j",
        "when": "editorTextFocus",
        "args": "<C-j>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+k",
        "when": "editorTextFocus",
        "args": "<C-k>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+l",
        "when": "editorTextFocus",
        "args": "<C-l>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+z",
        "when": "editorTextFocus",
        "args": "<C-z>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+x",
        "when": "editorTextFocus",
        "args": "<C-x>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+c",
        "when": "editorTextFocus",
        "args": "<C-c>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+v",
        "when": "editorTextFocus",
        "args": "<C-v>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+b",
        "when": "editorTextFocus",
        "args": "<C-b>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+n",
        "when": "editorTextFocus",
        "args": "<C-n>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+m",
        "when": "editorTextFocus",
        "args": "<C-m>"
    },
    {
        "command": "vscode-neovim.send",
        "key": "ctrl+7",
        "when": "editorTextFocus",
        "args": "<C-_>"
    }
]
```
