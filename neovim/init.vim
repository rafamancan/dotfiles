source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/paths.vim
source $HOME/.config/nvim/plug-config/ale.vim
source $HOME/.config/nvim/plug-config/ctrlf.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/easymotion.vim
source $HOME/.config/nvim/plug-config/lazygit.vim
source $HOME/.config/nvim/plug-config/lsp.vim
source $HOME/.config/nvim/plug-config/phpactor.vim
source $HOME/.config/nvim/plug-config/phpfmt.vim
source $HOME/.config/nvim/plug-config/rainbow.vim
source $HOME/.config/nvim/general/floating.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/themes/colors.vim
source $HOME/.config/nvim/themes/line.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/keys/which-key.vim
lua require 'plug-colorizer'
lua require 'lspconfig'.tsserver.setup{}
