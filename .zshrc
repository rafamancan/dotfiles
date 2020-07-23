ZSH_DISABLE_COMPFIX=true
export ZSH="/home/rmancan/.oh-my-zsh"
export WORKSPACE_INSTALL_POWERLINE="/usr/local/bin/powerline/powerline/bindings/bash/powerline.sh"
export PATH="/home/rmancan/.yarn/bin:$PATH"
export PATH="/home/rmancan/.local/bin:$PATH"
export PATH="/usr/local/lib/nodejs/node-v12.16.1-linux-x64/bin:$PATH"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$HOME/.symfony/bin:$PATH"
export REACT_EDITOR=code

 # Android SDK / JAVA
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:~/android-studio/bin


# ZSH_THEME="dracula"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  git 
  yarn
)

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
alias dup='sudo service apache2 stop && sudo service mysql stop && cd && cd workspace/liuv/laradock/ && docker-compose up -d nginx mysql mongo && cd -'	alias api='cd ~/workspace/gotchosen/influencers-API'
alias dres='cd && cd workspace/liuv/laradock/ && docker-compose restart && cd -'	
alias ddown='cd && cd workspace/liuv/laradock/ && docker-compose down && cd -'	
alias dbash='docker exec -it --user=`id -u rmancan` laradock_workspace_1 bash'	
alias dphp='docker exec -it -u=`id -u rmancan` -w="/var/www/api" laradock_workspace_1 php'	
alias bits='cd ~/workspace/17bits'	
alias api='cd ~/workspace/liuv/api'	
alias area='cd ~/workspace/liuv/area-estabelecimento'	
alias app='cd ~/workspace/liuv/app'	
alias appe='cd ~/workspace/liuv/app-estabelecimento'	
alias ya='yarn android --variant=developmentDebug  --appIdSuffix=dev'	
alias au='adb uninstall it.liuv.android.dev'	
alias rag='cd && cd workspace/personal/ragmaniacos'
alias liuv='cd ~/workspace/liuv/'

# Dar push na branch atual
function push () {
  git push origin $(git branch | grep \* | sed 's/\*\s//')
}
# Dar pull na branch atual
function pull () {
  git pull origin $(git branch | grep \* | sed 's/\*\s//')
}
# Atualizar branchs
function fet () {
  git fetch -u -p
}

# common use
alias vim='nvim'
alias v="nvim ."
alias c="code ."
alias port='lsof -i'
alias dps='docker ps'
alias ys='yarn start'
alias bkp='cd && chmod +x .bkp-dot.sh && ./.bkp-dot.sh'
alias fix='sudo apt update && sudo apt upgrade -y && sudo apt install -f && sudo apt autoremove'
alias cl='xclip -sel clip'
alias cc='dphp artisan config:clear'

fpath=($fpath "/home/rmancan/.zfunctions")
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
