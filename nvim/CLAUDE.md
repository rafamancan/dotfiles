# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Neovim configuration using the LazyVim framework. The configuration is structured as a modern Lua-based setup with plugin management, custom keymaps, and development tools integration.

## Architecture

### Core Structure
- **init.lua**: Entry point that bootstraps the configuration by requiring `config.lazy`
- **lua/config/**: Core configuration modules
  - `lazy.lua`: Plugin manager setup and LazyVim configuration
  - `options.lua`: Neovim options and settings
  - `keymaps.lua`: Custom key mappings and shortcuts
  - `autocmds.lua`: Auto-commands for automation
  - `utils.lua`: Utility functions
  - `whichkey.lua`: Which-key plugin configuration

### Plugin Management
- Uses **Lazy.nvim** as the plugin manager
- Built on **LazyVim** framework for sensible defaults
- Plugins are organized in `lua/plugins/` directory by category:
  - `lsp.lua`: Language Server Protocol configuration
  - `coding.lua`: Coding-related plugins
  - `editor.lua`: Editor enhancement plugins
  - `colorscheme.lua`: Theme and appearance
  - `treesitter.lua`: Syntax highlighting and parsing
  - `ai.lua`: AI assistant plugins (currently disabled)

### Language Support
The configuration includes extensive language server support via Mason:
- **Web**: TypeScript, JavaScript, HTML, CSS, TailwindCSS
- **Backend**: PHP (with Blade template support), Python
- **Configuration**: Lua, YAML, JSON
- **DevOps**: Docker, Bash, Nginx
- **Documentation**: Markdown

## Key Features

### Code Formatting
- **stylua**: Lua code formatting (configured in `stylua.toml`)
- **prettier**: JavaScript/TypeScript/CSS formatting
- **php-cs-fixer**: PHP code formatting
- Code formatting is disabled by default (`vim.g.autoformat = false`)

### Development Tools
- **Mason**: Automatic installation of LSP servers, formatters, and linters
- **Linting**: ESLint, PHPStan, shellcheck, markdownlint
- **Debugging**: Support for Bash, JavaScript, and PHP debugging
- **Git Integration**: Gitsigns for Git status in editor

### Custom Keymaps
- Leader key: `<Space>`
- Local leader: `<Space>`
- Window navigation: `<C-h/j/k/l>`
- Buffer navigation: `<TAB>` (next), `<S-TAB>` (previous)
- Quick save: `<C-s>`
- Search/replace: `<leader>rl` (line), `<leader>rf` (file)
- Tmux navigation integration

## Working with This Configuration

### Making Changes
1. **Plugin modifications**: Edit files in `lua/plugins/`
2. **Options changes**: Modify `lua/config/options.lua`
3. **Keymap additions**: Add to `lua/config/keymaps.lua`
4. **New plugins**: Create new files in `lua/plugins/` or extend existing ones

### Formatting and Linting
- Use `:Mason` to manage LSP servers and tools
- Stylua configuration is in `stylua.toml` (2-space indentation, 120 column width)
- Format on save is disabled by default
- Run `:LazyHealth` to check plugin health

### Plugin Management
- Use `:Lazy` to manage plugins
- Plugin lock file: `lazy-lock.json` (tracks exact versions)
- LazyVim extras are imported in `config/lazy.lua`

## File Organization

```
├── init.lua                 # Entry point
├── lazy-lock.json          # Plugin version lock file
├── lazyvim.json            # LazyVim configuration
├── stylua.toml             # Lua formatting configuration
├── lua/
│   ├── config/             # Core configuration
│   └── plugins/            # Plugin configurations
└── snippets/               # Code snippets for various languages
```

## Customization Notes

- The configuration extends LazyVim with custom plugins and settings
- Autoformat is disabled globally - formatting must be triggered manually
- Custom keymaps prioritize productivity with buffer/window navigation
- Language servers are automatically installed via Mason
- Tmux integration is enabled for seamless pane navigation