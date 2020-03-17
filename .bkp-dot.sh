#!/bin/bash
cp ~/.config/nvim/*.vim ~/dotfiles/.config/nvim/
cp ~/.config/nvim/*.json ~/dotfiles/.config/nvim/
cp ~/.zshrc ~/dotfiles/
cp ~/.bkp-dot.sh ~/dotfiles/
cd ~/dotfiles
git add .
dt=$(date '+%d/%m/%Y %H:%M:%S')
git commit -m "updating $dt"
git push -u origin master
