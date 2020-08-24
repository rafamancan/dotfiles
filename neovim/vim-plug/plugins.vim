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
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " fzf
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    " themes
    Plug 'dracula/vim', { 'as': 'dracula'  }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'junegunn/rainbow_parentheses.vim'
    " lint
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "javascript, typescript, css and jsx syntax
    Plug 'ianks/vim-tsx'
    Plug 'leafgarland/typescript-vim'
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'ap/vim-css-color'
    " php
    Plug 'phpactor/phpactor'
    Plug 'stephpy/vim-php-cs-fixer'
    Plug 'StanAngeloff/php.vim'
    " commentary
    Plug 'tpope/vim-commentary'
    "source tree
    Plug 'scrooloose/nerdtree'
    "find files/text (both brew install fzf and ripgrep are required)
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    "editor config
    Plug 'editorconfig/editorconfig-vim'
    " startify
    Plug 'mhinz/vim-startify'
    " git
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    " which key
    Plug 'liuchengxu/vim-which-key'
    " quickscope
    Plug 'unblevable/quick-scope'
    " wakatime
    Plug 'wakatime/vim-wakatime'
    " multiplecursors
    Plug 'terryma/vim-multiple-cursors'
call plug#end()

