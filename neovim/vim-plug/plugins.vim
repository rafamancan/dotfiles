call plug#begin('~/.config/nvim/autoload/plugged')
    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'hrsh7th/nvim-compe'
    Plug 'glepnir/lspsaga.nvim'

    " NOOOOICE
    Plug 'nvim-lua/plenary.nvim'
    Plug 'ThePrimeagen/harpoon'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'kyazdani42/nvim-web-devicons'

    " themes
    Plug 'arcticicestudio/nord-vim'
    Plug 'bluz71/vim-moonfly-colors'
    Plug 'itchyny/lightline.vim'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'kyazdani42/nvim-tree.lua'

    " neovim as editor
    Plug 'tpope/vim-commentary'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'mhinz/vim-startify'
    Plug 'wakatime/vim-wakatime'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-fugitive'
    Plug 'kdheepak/lazygit.nvim'
    Plug 'airblade/vim-gitgutter'
    Plug 'windwp/nvim-autopairs'
    Plug 'tpope/vim-surround'
    Plug 'github/copilot.vim'

    " snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " php
    Plug 'StanAngeloff/php.vim'
    Plug 'beanworks/vim-phpfmt'
    Plug 'w0rp/ale'
    Plug 'adoy/vim-php-refactoring-toolbox'
    Plug 'tobyS/pdv'
    Plug 'tobyS/vmustache'
call plug#end()
