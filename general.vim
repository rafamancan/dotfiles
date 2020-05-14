set encoding=UTF-8                  "UTF-8
set nocompatible                    "use vim settings instead of vi's
set autoread                        "reload file if changed outside vim
filetype plugin indent on           "minimal config
set clipboard=unnamedplus           "use system's clipboard
set expandtab                       "tabs are spaces
set number                          "show line numbers
set relativenumber                  "show relative numbers instead of absolute
set cursorline                      "highlight current line
set showcmd                         "show command in bottom bar
set cmdheight=1                     "size of command bar
set linespace=0
set inccommand=split                "show a previous of the result of a command
set showmatch                       "highlight matching [{()}]
set incsearch                       "search as characters are entered
set hlsearch                        "highlight matches
let mapleader = "\<Space>"          "changing leader key to SPACE
set noswapfile                      "removing swap files feature
set wildmenu                        "display command line's tab complete options as a menu.
set ignorecase                      "ignore case when searching
set smartcase                       "unless you type a capital

set tabstop=2                       "size of a hard tabstop
set expandtab                       "always use spaces instead of tabs
set shiftwidth=2                    "size of an indent

set splitbelow                      "new horizontal splits are on the bottom
set splitright                      "new vertical splits are on the right

"removing the help banner from netrw
let g:netrw_banner = 0

"set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

set list
set listchars=tab:▸\           " ┐
set listchars+=trail:·         " │ Use custom symbols to
set listchars+=eol:↴           " │ represent invisible characters
set listchars+=nbsp:_          " ┘


" rainbow_parentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
autocmd FileType * RainbowParentheses

" airline
let g:airline_theme = "gruvbox"
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#formatter = 'short_path'


" coc
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-json', 'coc-eslint', 'coc-prettier']

" close tags
let g:closetag_filenames = '*.html,*.jsx,*.tsx'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" NERDTree
let g:NERDTreeMinimalUI=1 "disable display of ? text and bookmarks
let g:NERDTreeQuitOnOpen = 1 "always close nerdtree when a file is opened
let g:NERDTreeWinSize=50 "increasing window size
let NERDTreeShowLineNumbers=1 "show line numbers on NERDTree
autocmd FileType nerdtree setlocal relativenumber "the line numbers are relative
let NERDTreeShowHidden=1 "show dotfiles


" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

