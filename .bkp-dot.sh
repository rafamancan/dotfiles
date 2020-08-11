#!/bin/bash
cp ~/.zshrc ~/dotfiles/
cp ~/.hyper.js ~/dotfiles/

cp -r ~/.config/nvim/general ~/dotfiles/neovim/general
cp -r ~/.config/nvim/keys ~/dotfiles/neovim/keys
cp -r ~/.config/nvim/lua ~/dotfiles/neovim/lua
cp -r ~/.config/nvim/plug-config ~/dotfiles/neovim/plug-config
cp -r ~/.config/nvim/themes ~/dotfiles/neovim/themes
cp -r ~/.config/nvim/vim-plug ~/dotfiles/neovim/vim-plug
cp ~/.config/nvim/init.vim ~/dotfiles/neovim/init.vim
cp ~/.config/nvim/coc-settings.json ~/dotfiles/neovim/coc-settings.json

cp ~/.bkp-dot.sh ~/dotfiles/

cd ~/dotfiles
git add .
dt=$(date '+%d/%m/%Y %H:%M:%S')
git commit -m "updating $dt"
git push -u origin master
