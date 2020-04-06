#!/bin/bash
cp ~/.config/nvim/*.vim ~/dotfiles/.config/nvim/
cp ~/.config/nvim/*.json ~/dotfiles/.config/nvim/
cp -r ~/.config/kitty/*.conf ~/dotfiles/.config/kitty/
cp -r ~/.config/terminator/* ~/dotfiles/.config/terminator/
cp ~/.zshrc ~/dotfiles/
cp ~/.tmux.conf ~/dotfiles/
cp ~/.bkp-dot.sh ~/dotfiles/
cd ~/dotfiles
git add .
dt=$(date '+%d/%m/%Y %H:%M:%S')
git commit -m "updating $dt"
git push -u origin master
