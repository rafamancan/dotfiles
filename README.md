# Dotfiles

Personal configuration files for development, including Neovim, Zsh, and terminal settings.

## Repository Structure

```
.
├── nvim/                    # Neovim configuration (LazyVim)
│   ├── init.lua
│   ├── lua/
│   │   ├── config/         # Options, keymaps, autocmds
│   │   └── plugins/        # Plugin specifications
│   └── snippets/           # Custom snippets (JS, TS, PHP)
├── fonts/                   # Nerd Fonts for terminal
│   ├── FiraCode/
│   ├── Inconsolata/
│   ├── InputMono/
│   ├── JetBrains Mono/
│   ├── Meslo/
│   ├── UbuntuMono/
│   └── VictorMono/
├── terms/                   # Terminal configurations
│   ├── iterm2/             # Profiles and color schemes
│   └── wezterm/            # Lua config
├── wsl/                     # Windows Terminal configs (WSL)
├── .p10k.zsh               # Powerlevel10k configuration
└── .luarc.json             # Lua LSP settings
```

## Neovim

**LazyVim**-based configuration optimized for PHP/Laravel and JavaScript/TypeScript development.

### Features

- **Plugin Manager**: [Lazy.nvim](https://github.com/folke/lazy.nvim)
- **Framework**: [LazyVim](https://www.lazyvim.org/)
- **Colorscheme**: Ayu Dark
- **Leader Key**: `<Space>`

### Language Support

| Language | LSP | Formatter | Linter |
|----------|-----|-----------|--------|
| PHP | Intelephense | php-cs-fixer | PHPStan |
| JavaScript/TypeScript | tsserver | Prettier | ESLint |
| Go | gopls | gofmt | - |
| Lua | lua_ls | stylua | - |
| Markdown | - | - | - |
| Docker | dockerls | - | - |

### Integrated Tools

- **AI**: GitHub Copilot
- **Git**: LazyGit
- **Testing**: Neotest (Pest adapter for PHP)
- **Debugging**: nvim-dap (XDebug)
- **File Explorer**: Oil.nvim
- **Time Tracking**: WakaTime

### Main Keymaps

| Keymap | Description |
|--------|-------------|
| `<C-p>` | Find files |
| `<C-e>` | Open buffers |
| `<TAB>` / `<S-TAB>` | Next/Previous buffer |
| `<leader>gg` | LazyGit |
| `<leader>cf` | Format buffer |
| `<leader>la` | Laravel Artisan |
| `<C-t>` | Toggle terminal |

> Full documentation at [nvim/README.md](./nvim/README.md)

## Terminal

### iTerm2 (macOS)

Included color schemes:
- Dracula
- Night Owl
- Nord
- OneHalfDark
- VSCode Dark
- Ayu Mirage
- Gruvbox
- Palenight
- Tokyo Night

**Installation:**
1. Open iTerm2 > Preferences > Profiles > Colors
2. Import from `terms/iterm2/*.itermcolors`

### WezTerm

Lua configuration with:
- Font: Hack Nerd Font Mono
- Color scheme: Ayu
- Vim-style keybindings for pane navigation
- WSL integration (Ubuntu 22.04)

**Keymaps:**
| Keymap | Description |
|--------|-------------|
| `Ctrl+Shift+E` | Split vertical |
| `Ctrl+Shift+O` | Split horizontal |
| `Alt+H/J/K/L` | Navigate panes |
| `Ctrl+Shift+H/J/K/L` | Resize panes |
| `Ctrl+W` | Close pane |

### Windows Terminal (WSL)

Configuration files in `wsl/`:
- `wterm-profile.json` - Profile settings
- `wterm-keys.json` - Custom keybindings

## Zsh

[Powerlevel10k](https://github.com/romkatv/powerlevel10k) configuration included in `.p10k.zsh`.

## Fonts

Nerd Fonts included for terminal icon support:

- **FiraCode** - Code ligatures
- **Inconsolata** - Classic and clean
- **InputMono** - Multiple weights
- **JetBrains Mono** - By JetBrains
- **Meslo LGS** - Recommended for Powerlevel10k
- **Ubuntu Mono** - Ubuntu's font
- **Victor Mono** - Cursive italics

**Installation (macOS):**
```bash
cp fonts/**/*.ttf ~/Library/Fonts/
```

**Installation (Linux):**
```bash
mkdir -p ~/.local/share/fonts
cp fonts/**/*.ttf ~/.local/share/fonts/
fc-cache -fv
```

## Installation

### Neovim

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Symlink
ln -s ~/dotfiles/nvim ~/.config/nvim

# Open Neovim (plugins will be installed automatically)
nvim
```

### Powerlevel10k

```bash
ln -s ~/dotfiles/.p10k.zsh ~/.p10k.zsh
```

### WezTerm

```bash
ln -s ~/dotfiles/terms/wezterm/.wezterm.lua ~/.wezterm.lua
```

## Dependencies

### Required
- Neovim >= 0.9.0
- Git
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- Node.js (for Copilot and LSPs)

### Recommended
- [LazyGit](https://github.com/jesseduffield/lazygit)
- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)

### PHP Development
- PHP >= 8.2
- Composer
- php-cs-fixer
- PHPStan

## License

[Apache License 2.0](./LICENSE)
