call plug#begin('~/.config/nvim/autoload/plugged')
    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'

    " fzf
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'dyng/ctrlsf.vim'

    " themes
    Plug 'gruvbox-community/gruvbox'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'sonph/onehalf', { 'rtp': 'vim/' }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'ryanoasis/vim-devicons'

    " lint
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    "javascript, typescript, css and jsx syntax
    Plug 'ianks/vim-tsx'
    Plug 'leafgarland/typescript-vim'
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'ap/vim-css-color'
    Plug 'styled-components/vim-styled-components', { 'branch': 'develop' }

    " php
    Plug 'StanAngeloff/php.vim'
    Plug 'beanworks/vim-phpfmt'
    Plug 'w0rp/ale'
    Plug 'adoy/vim-php-refactoring-toolbox'
    Plug 'tobyS/pdv'
    Plug 'tobyS/vmustache'

    " snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " commentary
    Plug 'tpope/vim-commentary'

    " neovim as editor
    Plug 'editorconfig/editorconfig-vim'
    Plug 'mhinz/vim-startify'
    Plug 'liuchengxu/vim-which-key'
    Plug 'wakatime/vim-wakatime'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-fugitive'
    Plug 'kdheepak/lazygit.nvim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
call plug#end()
