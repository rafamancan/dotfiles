source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/paths.vim
source $HOME/.config/nvim/plug-config/easymotion.vim
source $HOME/.config/nvim/plug-config/completion.vim
source $HOME/.config/nvim/plug-config/lazygit.vim
source $HOME/.config/nvim/plug-config/lsp.vim
source $HOME/.config/nvim/plug-config/snips.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/telescope.vim
source $HOME/.config/nvim/plug-config/tree.vim
source $HOME/.config/nvim/general/floating.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/themes/colors.vim
source $HOME/.config/nvim/themes/line.vim
lua require 'plug-colorizer'

lua require"lspconfig".tsserver.setup{on_attach=require'completion'.on_attach}
