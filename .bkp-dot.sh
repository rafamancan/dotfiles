#!/bin/bash
cp ~/.zshrc ~/dotfiles/

cp -r ~/.config/nvim/ ~/dotfiles/ 2>/dev/null
cp -r ~/.config/nvim-kickstart/ ~/dotfiles/ 2>/dev/null
cp ~/.tmux.conf ~/dotfiles/.tmux.conf 2>/dev/null
cp ~/.p10k.zsh ~/dotfiles/.p10k.zsh 2>/dev/null
cp ~/.config/starship.toml ~/dotfiles/startship.toml 2>/dev/null

cp ~/.gitconfig ~/dotfiles-pv/.gitconfig

cp ~/wterm-keys.json ~/dotfiles/wterm-keys.json 2>/dev/null

cp ~/.bkp-dot.sh ~/dotfiles/

cd ~/dotfiles || exit
git add .
dt=$(date '+%d/%m/%Y %H:%M:%S')
git commit -m "updating $dt"
git push -u origin master

cd ~/dotfiles-pv || exit
git add .
dtp=$(date '+%d/%m/%Y %H:%M:%S')
git commit -m "updating private $dtp"
git push -u origin main

echo "________________________________________________"
echo "Atualização realizada: $dt"
echo "Atualização realizada privado: $dtp"
echo "________________________________________________"
