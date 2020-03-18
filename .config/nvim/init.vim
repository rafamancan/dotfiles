"plugins with vim-plug
call plug#begin('~/.vim/plugged') 

"theme
Plug 'dracula/vim', { 'as': 'dracula' }

"fancy startup screen
Plug 'mhinz/vim-startify'
let g:startify_bookmarks = ['~/workspace/liuv/area-estabelecimento', '~/workspace/liuv/api', '~/workspace/liuv/app']

"status bar
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

"javascript, typescript and jsx syntax
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

"php
Plug 'arnaud-lb/vim-php-namespace'

"find files/text (both brew install fzf and ripgrep are required)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"editor config
Plug 'editorconfig/editorconfig-vim'

"code autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-json', 'coc-eslint', 'coc-prettier']

"auto close tags
Plug 'alvan/vim-closetag'
let g:closetag_filenames = '*.html,*.jsx,*.tsx'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

"source tree
Plug 'scrooloose/nerdtree'
let g:NERDTreeMinimalUI=1 "disable display of ? text and bookmarks
let g:NERDTreeQuitOnOpen = 1 "always close nerdtree when a file is opened
let g:NERDTreeWinSize=50 "increasing window size
let NERDTreeShowLineNumbers=1 "show line numbers on NERDTree
autocmd FileType nerdtree setlocal relativenumber "the line numbers are relative
let NERDTreeShowHidden=1 "show dotfiles


" misc
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'

call plug#end()

source ~/.config/nvim/general.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/theme.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/dim.vim
source ~/.config/nvim/floating.vim
