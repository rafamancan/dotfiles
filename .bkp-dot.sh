#!/bin/bash
cp ~/.zshrc ~/dotfiles/
cp ~/.bkp-dot.sh ~/dotfiles/
cp ~/.hyper.js ~/dotfiles/
cd ~/dotfiles
git add .
dt=$(date '+%d/%m/%Y %H:%M:%S')
git commit -m "updating $dt"
git push -u origin master
