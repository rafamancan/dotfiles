#!/bin/bash
cp ~/.zshrc ~/dotfiles/

cp -r ~/.config/lvim/config.lua ~/dotfiles/windows/lunarvim/ 2>/dev/null
cp ~/.config/starship.toml ~/dotfiles/
cp ~/.gitconfig ~/dotfiles/windows/.gitconfig

cp ~/.bkp-dot-win.sh ~/dotfiles/

cd ~/dotfiles || exit
git add .
dt=$(date '+%d/%m/%Y %H:%M:%S')
git commit -m "updating-win $dt"
git push -u origin master

echo "Atualização realizada para versao windows: $dt"
