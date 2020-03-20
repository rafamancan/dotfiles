ZSH_DISABLE_COMPFIX=true
export ZSH="/home/rmancan/.oh-my-zsh"
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export WORKSPACE_INSTALL_POWERLINE="/usr/local/bin/powerline/powerline/bindings/bash/powerline.sh"
export PATH="$(yarn global bin):$PATH"
export PATH="/home/rmancan/.local/bin:$PATH"

ZSH_THEME="agnoster"
plugins=(git)

source $ZSH/oh-my-zsh.sh
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

# personal use
alias dup='sudo service apache2 stop && cd && cd workspace/liuv/laradock/ && docker-compose up -d nginx mysql mongo && cd -'
alias dres='cd && cd workspace/liuv/laradock/ && docker-compose restart && cd -'
alias ddown='cd && cd workspace/liuv/laradock/ && docker-compose down && cd -'
alias dbash='docker exec -it --user=`id -u rmancan` laradock_workspace_1 bash'
alias dphp='docker exec -it -u=`id -u rmancan` -w="/var/www/api" laradock_workspace_1 php'
alias api='cd ~/workspace/liuv/api'
alias area='cd ~/workspace/liuv/area-estabelecimento'
alias app='cd ~/workspace/liuv/app'
alias ya='yarn android --variant=developmentDebug  --appIdSuffix=dev'
alias au='adb uninstall it.liuv.android.dev'

# common use
alias port='lsof -i'
alias dps='docker ps'
alias vim='/usr/bin/nvim.appimage'
alias yc='yarn commit'
alias ys='yarn start'
alias bkp='cd && chmod +x .bkp-dot.sh && ./.bkp-dot.sh'
alias fix='sudo apt update && sudo apt upgrade -y && sudo apt install -f && sudo apt autoremove'
alias cl='xclip -sel clip'

fpath=($fpath "/home/rmancan/.zfunctions")
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
