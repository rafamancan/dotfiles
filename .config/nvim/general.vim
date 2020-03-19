set encoding=UTF-8                  "UTF-8
set nocompatible                    "use vim settings instead of vi's
filetype plugin indent on           "minimal config
set clipboard=unnamedplus           "use system's clipboard
set expandtab                       "tabs are spaces
set number                          "show line numbers
set relativenumber                  "show relative numbers instead of absolute
set cursorline                      "highlight current line
set showcmd                         "show command in bottom bar
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

" disable linting while typing
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 1
let g:ale_keep_list_window_open=0
let g:ale_set_quickfix=0
let g:ale_list_window_size = 5
let g:ale_php_phpcbf_standard='PSR2'
let g:ale_php_phpcs_standard='phpcs.xml.dist'
let g:ale_php_phpmd_ruleset='phpmd.xml'
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'php': ['phpcbf', 'php_cs_fixer', 'remove_trailing_lines', 'trim_whitespace'],
  \}
let g:ale_fix_on_save = 1
let g:phpactor_executable = '~/.config/vim/plugged/phpactor/bin/phpactor'
