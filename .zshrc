# PATHS
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/home/rmancan/.oh-my-zsh"
export WORKSPACE_INSTALL_POWERLINE="/usr/local/bin/powerline/powerline/bindings/bash/powerline.sh"
export PATH="/home/rmancan/.yarn/bin:$PATH"
export PATH="/home/rmancan/.local/bin:$PATH"
export PATH="/usr/local/lib/nodejs/node-v12.18.3-linux-x64/bin:$PATH"
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Android SDK / JAVA
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:~/android-studio/bin

# THEME
ZSH_THEME="robbyrussell"

# PLUGINS
plugins=(
    git
    yarn
)

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

fpath=($fpath "/home/rmancan/.zfunctions")


# PERSONAL ALIASES
# DOCKER
alias cc='dphp artisan config:clear'
alias dup='cd && cd workspace/liuv/laradock/ && docker-compose up -d nginx mysql mongo && cd -'
alias dres='cd && cd workspace/liuv/laradock/ && docker-compose restart && cd -'	
alias ddown='cd && cd workspace/liuv/laradock/ && docker-compose down && cd -'	
alias dbash='docker exec -it --user=`id -u rmancan` laradock_workspace_1 bash'	
alias dphp='docker exec -it -u=`id -u rmancan` -w="/var/www/api" laradock_workspace_1 php'	
alias dps='docker ps'

# FOLDERS
alias api='cd ~/workspace/liuv/api'
alias area='cd ~/workspace/liuv/area-estabelecimento'
alias car='cd ~/workspace/liuv/cardapio-digital'
alias app='cd ~/workspace/liuv/app'
alias appe='cd ~/workspace/liuv/app-estabelecimento'
alias por='cd ~/workspace/liuv/portal-restaurante'
alias liuv='cd ~/workspace/liuv/'

# ANDROID DEVELOPMENT UTILS
alias ya='yarn android --variant=developmentDebug  --appIdSuffix=dev'
alias au='adb uninstall it.liuv.android.dev'

# JS and TS DEVELOPMENT UTILS
alias ys='yarn start'
alias vim='nvim'
alias v="vim"
alias c="code ."

# SYSTEM UTILS
alias bkp='cd && chmod +x .bkp-dot.sh && ./.bkp-dot.sh'
alias cl='xclip -sel clip'
alias fix='sudo apt update && sudo apt --fix-broken install && sudo apt upgrade -y && sudo apt install -f && sudo apt autoremove'
alias port='lsof -i'

# PERSONAL FUNCTIONS
# push actual branch
function push () {
  git push origin $(git branch | grep \* | sed 's/\*\s//')
}
# pull actual branch
function pull () {
  git pull origin $(git branch | grep \* | sed 's/\*\s//')
}
# updating branch
function fet () {
  git fetch -u -p
}

# STARSHIP AS DEFAULT
eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
