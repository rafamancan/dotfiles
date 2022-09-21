# PATHS
export ZSH="$HOME/.oh-my-zsh"
export PATH="/home/rmancan/.local/bin:$PATH"
export PATH="/home/rmancan/.local/bin:$PATH"
export PATH="/opt/asdf-vm/bin:$PATH"
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.phpenv/bin:$PATH"

# PHP 7
alias php="/usr/sbin/php7"

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

[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# OH-MY-ZSH PLUGINS
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
alias bkp='cd && chmod +x .bkp-dot.sh && ./.bkp-dot.sh'
alias cl='xclip -sel clip'
alias ip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias fix='sudo apt update && sudo apt --fix-broken install && sudo apt upgrade -y && sudo apt install -f && sudo apt autoremove'
alias port='lsof -i'
alias not='echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_watches
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_queued_events
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_instances
'
alias python='/usr/local/bin/python3.7'
alias ls='exa --icons'
alias cat='bat --style=auto'

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

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(ssh-agent -s)"
