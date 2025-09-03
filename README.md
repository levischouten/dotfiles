# dotfiles

Personal configuration files for a modern development environment on macOS.

## Setup Overview

- **shell**: fish with custom configurations and functions
- **editor**: neovim with lazy.nvim plugin management
- **terminal**: ghostty with custom theming
- **multiplexer**: tmux with vim-style keybindings

## Key Tools

- | Tool                | Purpose                                 |
  | ------------------- | --------------------------------------- |
  | [fish](fish/)       | Shell with intelligent autocompletion   |
  | [nvim](nvim/)       | Text editor with LSP and modern plugins |
  | [ghostty](ghostty/) | GPU-accelerated terminal emulator       |

## Installation

Clone to `~/.config`:

```bash
git clone https://github.com/levischouten/dotfiles ~/.config
```

Individual tool configurations can be symlinked or copied as needed.
