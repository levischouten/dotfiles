# dotfiles

Personal configuration files for a modern development environment on macOS.

## Setup Overview

- **Shell**: Fish with custom configurations and functions
- **Editor**: Neovim with Lazy.nvim plugin management
- **Terminal**: Ghostty with custom theming
- **Multiplexer**: tmux with vim-style keybindings

## Key Tools

| Tool                | Purpose                                     |
| ------------------- | ------------------------------------------- |
| [fish](fish/)       | Shell with intelligent autocompletion       |
| [nvim](nvim/)       | Text editor with LSP and modern plugins     |
| [tmux](tmux/)       | Terminal multiplexer with custom status bar |
| [ghostty](ghostty/) | GPU-accelerated terminal emulator           |

## Installation

Clone to `~/.config`:

```bash
git clone https://github.com/levischouten/dotfiles ~/.config
```

Individual tool configurations can be symlinked or copied as needed.
