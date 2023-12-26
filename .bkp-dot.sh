#!/bin/bash
cp ~/.zshrc ~/dotfiles/

cp -r ~/.config/nvim/ ~/dotfiles/neovim/ 2>/dev/null
cp ~/.tmux.conf ~/dotfiles/.tmux.conf 2>/dev/null

cp ~/.gitconfig ~/dotfiles-pv/.gitconfig

cp ~/wterm-keys.json ~/dotfiles/wterm-keys.json 2>/dev/null

cp ~/.bkp-dot.sh ~/dotfiles/

cd ~/dotfiles || exit
git add .
dt=$(date '+%d/%m/%Y %H:%M:%S')
git commit -m "updating $dt"
git push -u origin master

cd ~/dotfiles || exit
git add .
dt=$(date '+%d/%m/%Y %H:%M:%S')
git commit -m "updating private $dt"
git push -u origin main

echo "Atualização realizada: $dt"
