# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export NODE_OPTIONS=--max_old_space_size=4096


# PATHS
export PATH="/Users/local/bin:/Users/bin:$PATH"
export ZSH="/Users/rmancan/.oh-my-zsh"
export WORKSPACE_INSTALL_POWERLINE="/Users/local/bin/powerline/powerline/bindings/bash/powerline.sh"
export PATH="/Users/rmancan/.yarn/bin:$PATH"
export PATH="/Users/rmancan/.local/bin:$PATH"
export PATH="/Users/local/lib/nodejs/node-v12.18.3-linux-x64/bin:$PATH"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PATH="/Library/Ruby/Gems/2.6.0:$PATH"

# Android SDK / JAVA
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export ANDROID_HOME=/Users/rmancan/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:~/android-studio/bin
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Variables
export MYVIMRC="/Users/rmancan/.config/nvim/init.vim"

# THEME
ZSH_THEME="robbyrussell"

# PLUGINS
plugins=(
    git
    yarn
)
#SETUP
ZSH_DISABLE_COMPFIX=true

# OH-MY-ZSH PATH
source $ZSH/oh-my-zsh.sh

# ZPLUGINS
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit

(( ${+_comps} )) && _comps[zplugin]=_zplugin

zplugin light zdharma/fast-syntax-highlighting
zplugin light zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-history-substring-search
zplugin light zsh-users/zsh-completions
zplugin light buonomo/yarn-completion

zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

fpath=($fpath "/Users/rmancan/.zfunctions")


# PERSONAL ALIASES
# DOCKER
alias cc='dphp artisan config:clear'
alias dup='cd && cd workspace/liuv/laradock/ && docker-compose up -d nginx mysql && cd -'
alias dres='cd && cd workspace/liuv/laradock/ && docker-compose restart && cd -'	
alias ddown='cd && cd workspace/liuv/laradock/ && docker-compose down && cd -'	
alias dbash='docker exec -it --user=`id -u rmancan` laradock_workspace_1 bash'	
alias dphp='docker exec -it -u=`id -u rmancan` -w="/var/www/api" laradock_workspace_1 php'	
alias dps='docker ps'

# FOLDERS
alias api='cd ~/workspace/liuv/api'
alias area='cd ~/workspace/liuv/area-estabelecimento'
alias site='cd ~/workspace/liuv/site'
alias car='cd ~/workspace/liuv/cardapio-digital'
alias app='cd ~/workspace/liuv/app'
alias appe='cd ~/workspace/liuv/app-estabelecimento'
alias por='cd ~/workspace/liuv/portal-restaurante'
alias npor='cd ~/workspace/liuv/portal-restaurante-new'
alias lpb='cd ~/workspace/liuv/lpb'
alias con='cd ~/workspace/liuv/connector'
alias ui='cd ~/workspace/liuv/package-ui-toolkit'
alias liuv='cd ~/workspace/liuv/'
alias per='cd ~/workspace/personal/'
alias vf='cd ~/.config/nvim && v'

# ANDROID DEVELOPMENT UTILS
alias ya='yarn android --variant=developmentDebug  --appIdSuffix=dev'
alias au='adb uninstall it.liuv.android.dev'

# JS and TS DEVELOPMENT UTILS
alias ys='yarn start'
alias yd='yarn dev'
alias yrm='rm -Rf node_modules/ yarn.lock package-lock.json yarn-error.log && yarn install'
alias yst='yarn storybook'

# SYSTEM UTILS
alias v="vim"
alias vim='nvim'
alias c="code-insiders ."
alias bkp='cd && chmod +x .bkp-dot.sh && ./.bkp-dot.sh'
alias cl='xclip -sel clip'
alias ip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias ls="exa --icons"
alias fix='sudo apt update && sudo apt --fix-broken install && sudo apt upgrade -y && sudo apt install -f && sudo apt autoremove'
alias port='lsof -i'
alias not='echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_watches
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_queued_events
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_instances
'
alias ctags="`brew --prefix`/bin/ctags"
alias python='/usr/local/bin/python3.7'

# PERSONAL FUNCTIONS
# push actual branch
function push () {
  git push origin $(git branch --show-current)
}
# pull actual branch
function pull () {
  git pull origin $(git branch --show-current)
}
# updating branch
function fet () {
  git fetch -u -p
}

function tags () {
  ctags -R --exclude=.git --exclude=node_modules
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
