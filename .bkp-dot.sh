#!/bin/bash
cp ~/.config/nvim/*.vim ~/dotfiles/
cp ~/.config/nvim/*.json ~/dotfiles/
cp -r ~/.config/kitty/*.conf ~/dotfiles/.config/kitty/
cp ~/.zshrc ~/dotfiles/
cp ~/.tmux.conf ~/dotfiles/
cp ~/.bkp-dot.sh ~/dotfiles/
cd ~/dotfiles
git add .
dt=$(date '+%d/%m/%Y %H:%M:%S')
git commit -m "updating $dt"
git push -u origin master
