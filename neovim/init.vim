source $HOME/.config/nvim/vim-plug/plugins.vim

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/paths.vim
source $HOME/.config/nvim/general/floating.vim

source $HOME/.config/nvim/keys/mappings.vim

source $HOME/.config/nvim/themes/colors.vim
source $HOME/.config/nvim/themes/line.vim
lua require 'plug-colorizer'

lua require"lspconfig".tsserver.setup{on_attach=require'completion'.on_attach}
