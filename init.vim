"plugins with vim-plug
call plug#begin('~/.vim/plugged') 

  "theme
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'junegunn/rainbow_parentheses.vim'

    "status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'itchyny/vim-gitbranch'

    "javascript, typescript and jsx syntax
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'maxmellon/vim-jsx-pretty'

  "find files/text (both brew install fzf and ripgrep are required)
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  "editor config
  Plug 'editorconfig/editorconfig-vim'

  "code autocomplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  "auto close tags
  Plug 'alvan/vim-closetag'

  "git plugin
  Plug 'tpope/vim-fugitive'

  "commentary
  Plug 'tpope/vim-commentary'

  "source tree
  Plug 'scrooloose/nerdtree'
    "misc
  Plug 'wakatime/vim-wakatime'
  Plug 'mhinz/vim-startify'
  Plug 'easymotion/vim-easymotion'

call plug#end()

source ~/.config/nvim/general.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/theme.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/dim.vim
source ~/.config/nvim/floating.vim
