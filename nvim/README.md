# Neovim Configuration

Configuração do Neovim otimizada para desenvolvimento PHP/Laravel, com suporte completo para diversas linguagens.

## 📋 Estrutura

```
.
├── init.lua                 # Entry point - carrega config.lazy
├── lua/
│   ├── config/             # Core configuration
│   │   ├── lazy.lua        # Plugin manager setup
│   │   ├── options.lua     # Vim options
│   │   ├── keymaps.lua     # Key mappings
│   │   ├── autocmds.lua    # Autocommands
│   │   └── formatting.lua  # Custom formatting logic
│   └── plugins/            # Plugin specifications
│       ├── php.lua         # PHP/Laravel tools
│       ├── editor.lua      # Editor enhancements
│       ├── coding.lua      # Coding assistance
│       ├── treesitter.lua  # Syntax highlighting
│       ├── snacks.lua      # Dashboard & UI
│       ├── none-ls.lua     # Linting & formatting
│       └── disabled.lua    # Disabled plugins
└── README.md               # This file
```

## ⚡ Features

### Core Features
- **Plugin Manager**: Lazy.nvim
- **Framework**: LazyVim
- **Leader Key**: `<Space>`

### Language Support
- **PHP** (Intelephense LSP)
  - Laravel specific tools
  - Pest testing integration
  - XDebug debugging
  - Custom formatting (php-cs-fixer)
- **Go**
- **Markdown**
- **Docker**
- **JavaScript/TypeScript**

### Development Tools
- **LSP**: Full language server support
- **AI**: GitHub Copilot integration
- **Git**: LazyGit integration
- **Terminal**: ToggleTerm (floating)
- **Testing**: Neotest with Pest adapter
- **Debugging**: nvim-dap with XDebug

### Editor Enhancements
- **File Navigation**: Harpoon, Snacks picker
- **Code Outline**: Aerial
- **Tmux Integration**: Seamless navigation
- **File Explorer**: Oil.nvim
- **Time Tracking**: WakaTime

## 🎨 UI Features

### Custom Dashboard
- ASCII art logo personalizado
- Quick actions (Lazy, Mason, TSUpdate)
- Recent files
- Projects list

### Performance
- Plugins desabilitados para melhor performance:
  - flash.nvim
  - mini.animate
  - nvim-notify
- TreeSitter context desabilitado
- Animações desabilitadas

## ⌨️ Principais Keymaps

### Geral
| Keymap | Modo | Descrição |
|--------|------|-----------|
| `<Space>` | Normal | Leader key |
| `<C-s>` | Normal | Save file |
| `<C-a>` | Normal | Select all |
| `<Esc>` | Normal | Clear search highlight |

### Navegação
| Keymap | Modo | Descrição |
|--------|------|-----------|
| `<TAB>` | Normal | Next buffer |
| `<S-TAB>` | Normal | Previous buffer |
| `<C-h/j/k/l>` | Normal | Navigate windows |
| `<leader>bd` | Normal | Delete buffer |
| `<leader>bo` | Normal | Close all except current |

### Busca e Arquivos
| Keymap | Modo | Descrição |
|--------|------|-----------|
| `<C-p>` | Normal | Find files |
| `<C-e>` | Normal | Open buffers |
| `<c-f>` | Normal | Hop pattern search |

### Git
| Keymap | Modo | Descrição |
|--------|------|-----------|
| `<leader>gg` | Normal | LazyGit |

### Code
| Keymap | Modo | Descrição |
|--------|------|-----------|
| `<leader>cf` | Normal | Format buffer |
| `<leader>ta` | Normal | Toggle Aerial (outline) |
| `<leader>sa` | Visual | Surround add |
| `<leader>sd` | Normal | Surround delete |
| `<leader>sr` | Normal | Surround replace |

### Laravel
| Keymap | Modo | Descrição |
|--------|------|-----------|
| `<leader>la` | Normal | Artisan commands |
| `<leader>lr` | Normal | Routes |
| `<leader>lm` | Normal | Related files |

### Search & Replace
| Keymap | Modo | Descrição |
|--------|------|-----------|
| `<leader>rl` | Normal | Replace in line |
| `<leader>rf` | Normal | Replace in file |

### Visual Mode
| Keymap | Modo | Descrição |
|--------|------|-----------|
| `</>` | Visual | Indent (stay in mode) |
| `J/K` | Visual | Move selection up/down |
| `p` | Visual | Paste without yanking |

### Terminal
| Keymap | Modo | Descrição |
|--------|------|-----------|
| `<C-t>` | Normal/Terminal | Toggle terminal |
| `<Esc><Esc>` | Terminal | Exit terminal mode |

### Harpoon
| Keymap | Modo | Descrição |
|--------|------|-----------|
| `<leader>Ha` | Normal | Add file to harpoon |
| `<leader>Hl` | Normal | Harpoon menu |

## 🔧 PHP Development

### Formatação
- **Formatter**: php-cs-fixer
- **Comando**: `<leader>cf` (manual)
- **Auto-format**: Desabilitado (vim.g.autoformat = false)

### Linting
- **Tool**: PHPStan (via none-ls)
- **Modo**: Automático

### Testing
- **Framework**: Pest
- **Adapter**: neotest-pest
- **Parallel**: 16 workers

### Debugging
- **Tool**: XDebug 3
- **Port**: 9003
- **Adapter**: php-debug-adapter

## 📦 Instalação

1. Backup da configuração existente:
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. Clone esta configuração:
```bash
git clone <repo> ~/.config/nvim
```

3. Abra o Neovim (plugins serão instalados automaticamente):
```bash
nvim
```

4. Instale ferramentas via Mason:
```vim
:Mason
```

## 🛠️ Dependências

### Obrigatórias
- Neovim >= 0.9.0
- Git
- Node.js (para Copilot e debug adapters)
- ripgrep (para buscas)

### PHP Development
- PHP >= 8.2
- Composer
- php-cs-fixer (via composer)
- PHPStan (via composer)

### Opcional
- LazyGit (git UI)
- WakaTime CLI (time tracking)
- Tmux (integration)

## 🎯 Performance

### Otimizações Aplicadas
1. Plugins built-in desabilitados (gzip, tar, zip)
2. Lazy loading quando possível
3. TreeSitter context desabilitado
4. Animações desabilitadas
5. Syntax highlighting limitado a 300 colunas
6. Update time: 250ms
7. Timeout len: 300ms

### Startup Time
Para verificar o tempo de inicialização:
```bash
nvim --startuptime startup.log
```

## 📝 Customização

### Adicionar Plugins
Crie um arquivo em `lua/plugins/`:
```lua
-- lua/plugins/meu-plugin.lua
return {
  {
    "usuario/plugin",
    opts = {},
  },
}
```

### Modificar Keymaps
Edite `lua/config/keymaps.lua` ou crie keymaps específicos nos plugins.

### Adicionar Language Servers
Edite `lua/config/lazy.lua` e adicione:
```lua
{ import = "lazyvim.plugins.extras.lang.LINGUAGEM" },
```

## 🐛 Troubleshooting

### Verificar Health
```vim
:checkhealth
```

### Logs do Lazy
```vim
:Lazy log
```

### LSP Info
```vim
:LspInfo
```

### Treesitter Info
```vim
:TSInstallInfo
```

## 📚 Recursos

- [LazyVim Documentation](https://www.lazyvim.org/)
- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)

## 🎨 Tema

- **Colorscheme**: TokyoNight
- **Transparência**: Habilitada
- **True colors**: Habilitado
