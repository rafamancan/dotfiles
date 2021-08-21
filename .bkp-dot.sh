#!/bin/bash
exec > /dev/null

cp ~/.zshrc ~/dotfiles/

cp -r ~/.config/kitty ~/dotfiles/
cp -r ~/.config/nvim/ ~/dotfiles/neovim/
cp ~/.tmux.conf.local ~/dotfiles/.tmux.conf.local
cp ~/.gitconfig ~/dotfiles/.gitconfig

cp ~/.bkp-dot.sh ~/dotfiles/

cd ~/dotfiles || exit
git add .
dt=$(date '+%d/%m/%Y %H:%M:%S')
git commit -m "updating $dt"
git push -u origin master
