#!/bin/bash
cp ~/.config/nvim/*.vim ~/dotfiles/.config/nvim/
cp ~/.config/nvim/*.json ~/dotfiles/.config/nvim/
cp ~/.zshrc ~/dotfiles/
cp ~/.bkp-dot.sh ~/dotfiles/
cd ~/dotfiles
git add .
git commit -m "updating"
git push -u origin master
