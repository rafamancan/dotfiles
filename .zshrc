# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# PATHS
export PATH="/Users/local/bin:/Users/bin:$PATH"
export ZSH="/Users/rmancan/.oh-my-zsh"
export WORKSPACE_INSTALL_POWERLINE="/Users/local/bin/powerline/powerline/bindings/bash/powerline.sh"
export PATH="/Users/rmancan/.yarn/bin:$PATH"
export PATH="/Users/rmancan/.local/bin:$PATH"
export PATH="/Users/local/lib/nodejs/node-v12.18.3-linux-x64/bin:$PATH"
export PATH="$PATH:/Users/rmancan/.composer/vendor/bin"
export PATH="/System/Volumes/Data/Users/rmancan/.gem/ruby/2.6.0:$PATH"
export PATH="/opt/homebrew/opt/php@7.0/bin:$PATH"
export PATH="/opt/homebrew/opt/php@7.0/sbin:$PATH"
export PHP_CS_FIXER_IGNORE_ENV=false

# Android SDK / JAVA
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.12.jdk/Contents/Home
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Variables
export MYVIMRC="/Users/rmancan/.config/nvim/init.vim"

# THEME
ZSH_THEME="powerlevel10k/powerlevel10k"

# PLUGINS
plugins=(
    git
    yarn
    zsh-autosuggestions
    zsh-wakatime
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
alias dbash='cd ~/workspace/services/fenix-dockerize/dev && docker compose exec app sh'
alias dup='cd ~/workspace/services/fenix-dockerize/dev && docker compose up -d'
alias ddown='cd ~/workspace/services/fenix-dockerize/dev && docker compose down'
alias dlog='cd ~/workspace/services/fenix-dockerize/dev && docker compose logs -t -f'
alias dps='docker ps'

# FOLDERS
alias ser='cd ~/workspace/services/'
alias api='cd ~/workspace/services/app-fenix'
alias ges='cd ~/workspace/services/manager-fenix'
alias poc='cd ~/workspace/services/POCS/'
alias per='cd ~/workspace/personal/'
alias vf='cd ~/.config/nvim && v'
alias api='cd ~/workspace/services/app-fenix'
alias chat='cd ~/workspace/services/chat-fenix'

# ANDROID DEVELOPMENT UTILS
alias ya='yarn android --variant=developmentDebug  --appIdSuffix=dev'

# JS and TS DEVELOPMENT UTILS
alias ys='yarn start'
alias yd='yarn dev'
alias yb='yarn build'
alias yrm='rm -Rf node_modules/ yarn.lock package-lock.json yarn-error.log && yarn install'
alias yst='yarn storybook'

# PHP DEVELOPMENT UTILS
alias pas='php artisan serve'

# SYSTEM UTILS
alias v="vim"
alias vim='nvim'
alias c="code ."
alias t="tmux"
alias bkp='cd && chmod +x .bkp-dot.sh && ./.bkp-dot.sh'
alias cl='xclip -sel clip'
alias ip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias fix='sudo apt update && sudo apt --fix-broken install && sudo apt upgrade -y && sudo apt install -f && sudo apt autoremove'
alias port='lsof -i'
alias not='echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_watches
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_queued_events
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_instances
'
alias ctags="`brew --prefix`/bin/ctags"
alias python='/usr/local/bin/python3.7'
alias ls='exa --icons'

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

[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
