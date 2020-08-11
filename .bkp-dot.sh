#!/bin/bash
cp ~/.zshrc ~/dotfiles/
cp ~/.hyper.js ~/dotfiles/

cp -r ~/.config/nvim/general ~/dotfiles/neovim/
cp -r ~/.config/nvim/keys ~/dotfiles/neovim/
cp -r ~/.config/nvim/lua ~/dotfiles/neovim/
cp -r ~/.config/nvim/plug-config ~/dotfiles/neovim/
cp -r ~/.config/nvim/themes ~/dotfiles/neovim/
cp -r ~/.config/nvim/vim-plug ~/dotfiles/neovim/
cp ~/.config/nvim/init.vim ~/dotfiles/neovim/init.vim
cp ~/.config/nvim/coc-settings.json ~/dotfiles/neovim/coc-settings.json

cp ~/.bkp-dot.sh ~/dotfiles/

cd ~/dotfiles
git add .
dt=$(date '+%d/%m/%Y %H:%M:%S')
git commit -m "updating $dt"
git push -u origin master
