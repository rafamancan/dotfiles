#!/bin/bash
cp ~/.zshrc ~/dotfiles/

cp -r ~/.config/nvim/ ~/dotfiles/neovim/ 2>/dev/null
cp -r ~/.config/lvim/config.lua ~/dotfiles/lunarvim/ 2>/dev/null
# cp ~/.config/starship.toml ~/dotfiles/
# cp ~/.tmux.conf.local ~/dotfiles/.tmux.conf.local 2>/dev/null
cp ~/.gitconfig ~/dotfiles/.gitconfig

cp ~/.bkp-dot.sh ~/dotfiles/

cd ~/dotfiles || exit
git add .
dt=$(date '+%d/%m/%Y %H:%M:%S')
git commit -m "updating $dt"
git push -u origin master

echo "Atualização realizada: $dt"
