" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " fzf
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    " themes
    Plug 'morhetz/gruvbox'
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
    " php
    Plug 'stephpy/vim-php-cs-fixer'
    Plug 'StanAngeloff/php.vim'
    Plug 'w0rp/ale'
    Plug 'adoy/vim-php-refactoring-toolbox'
    Plug 'tobyS/pdv'
    Plug 'tobyS/vmustache'
    " snips
    Plug 'SirVer/ultisnips'
    " commentary
    Plug 'tpope/vim-commentary'
    "source tree
    Plug 'scrooloose/nerdtree'
    "editor config
    Plug 'editorconfig/editorconfig-vim'
    " startify
    Plug 'mhinz/vim-startify'
    " which key
    Plug 'liuchengxu/vim-which-key'
    " wakatime
    Plug 'wakatime/vim-wakatime'
    " easymotion
    Plug 'easymotion/vim-easymotion'
call plug#end()
