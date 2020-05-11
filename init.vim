"plugins with vim-plug
call plug#begin('~/.vim/plugged') 

"theme
Plug 'dracula/vim', { 'as': 'dracula' }

"status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/vim-gitbranch'

let g:airline_theme = "dracula"
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#formatter = 'short_path'

"javascript, typescript and jsx syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

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

"git plugin
Plug 'tpope/vim-fugitive'

"commentary
Plug 'tpope/vim-commentary'

"source tree
Plug 'scrooloose/nerdtree'
let g:NERDTreeMinimalUI=1 "disable display of ? text and bookmarks
let g:NERDTreeQuitOnOpen = 1 "always close nerdtree when a file is opened
let g:NERDTreeWinSize=50 "increasing window size
let NERDTreeShowLineNumbers=1 "show line numbers on NERDTree
autocmd FileType nerdtree setlocal relativenumber "the line numbers are relative
let NERDTreeShowHidden=1 "show dotfiles

"misc
Plug 'wakatime/vim-wakatime'
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings

call plug#end()

source ~/.config/nvim/general.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/theme.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/dim.vim
source ~/.config/nvim/floating.vim
