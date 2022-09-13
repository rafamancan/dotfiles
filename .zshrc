# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="/home/rmancan/.local/bin:$PATH"
export PATH="/home/rmancan/.local/bin:$PATH"
# alias php="/usr/bin/php7.1"

ZSH_THEME="robbyrussell"

plugins=(
    git
    yarn
    zsh-autosuggestions
    zsh-wakatime
    brew
    macos
    colorize
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

. $HOME/.asdf/asdf.sh
plugins=(
    git
    yarn
    zsh-autosuggestions
    zsh-wakatime
    brew
    macos
    colorize
    zsh-syntax-highlighting
)

# PERSONAL ALIASES
HD_PATH='/home/rmancan/workspace'

# DOCKER
alias dps="docker ps"
alias dup="docker-compose up -d"
alias ddown="docker-compose down"

# FOLDERS
alias dev="cd ${HD_PATH}"
alias np="cd ${HD_PATH}/noping"
alias site="cd ${HD_PATH}/noping/nptunnel.com.new"
alias adm="cd ${HD_PATH}/noping/nptunnel.service.panel"
alias land="cd ${HD_PATH}/noping/credit-card.landing.nptunnel.com"
alias api="cd ${HD_PATH}/noping/com.nptunnel.auth_api.php"
alias prox="cd ${HD_PATH}/noping/com.nptunnel.proxy_data_helper.php"

alias tes="cd ${HD_PATH}/personal/test"
alias per="cd ${HD_PATH}/personal/"
alias vf='cd ~/.config/nvim && v'

# SYSTEM UTILS
alias vim="nvim"
alias v="lvim"
alias c="code ."
alias t="tmux"
# alias bkp='cd && chmod +x .bkp-dot.sh && ./.bkp-dot.sh'
alias bkp='cd && chmod +x .bkp-dot-win.sh && ./.bkp-dot-win.sh'
alias cl='xclip -sel clip'
alias ip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"alias fix='sudo apt update && sudo apt --fix-broken install && sudo apt upgrade -y && sudo apt install -f && sudo apt autoremove'
alias port='lsof -i'
alias not='echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_watches
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_queued_events
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_instances
'
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

eval "$(starship init zsh)"
