#!/bin/bash
cp ~/.zshrc ~/dotfiles/

cp -r ~/.config/kitty ~/dotfiles/ 2>/dev/null
cp -r ~/.config/nvim/ ~/dotfiles/neovim/ 2>/dev/null
cp ~/.tmux.conf.local ~/dotfiles/.tmux.conf.local 2>/dev/null
cp ~/.gitconfig ~/dotfiles/.gitconfig

cp ~/.bkp-dot.sh ~/dotfiles/

cd ~/dotfiles || exit
git add . 2>/dev/null
dt=$(date '+%d/%m/%Y %H:%M:%S')
git commit -m "updating $dt" 2>/dev/null
git push -u origin master 2>/dev/null

echo "Atualização realizada: $dt"
