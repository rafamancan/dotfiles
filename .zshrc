# PATHS
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"

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

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# OH-MY-ZSH PLUGINS
plugins=(
    git
    yarn
    zsh-autosuggestions
    zsh-wakatime
    colorize
    zsh-syntax-highlighting
)

# PERSONAL ALIASES
HD_PATH='/home/rmancan/workspace'

# DOCKER
alias dps="docker ps"
alias dup="docker-compose up -d"
alias ddown="docker-compose down"
dex() {
  docker exec -it "$1" /bin/sh
}

# FOLDERS
alias dev="cd ${HD_PATH}"
alias np="cd ${HD_PATH}/noping"
alias navi="cd ${HD_PATH}/navi"
alias site="cd ${HD_PATH}/noping/nptunnel.com.new"
alias adm="cd ${HD_PATH}/noping/nptunnel.service.panel"
alias land="cd ${HD_PATH}/noping/credit-card.landing.nptunnel.com"
alias api="cd ${HD_PATH}/noping/com.nptunnel.auth_api.php"
alias prox="cd ${HD_PATH}/noping/com.nptunnel.proxy_data_helper.php"
alias ipn="cd ${HD_PATH}/noping/new-ipn"
alias sds="cd ${HD_PATH}/noping/smart-ds"
alias napi="cd ${HD_PATH}/navi/com.navivpn.api"
alias nadm="cd ${HD_PATH}/navi/com.navivpn.panel"
alias nsite="cd ${HD_PATH}/navi/com.navivpn.site"
alias ndoc="cd ${HD_PATH}/navi/com.navivpn.dockerize"

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
alias so='source ~/.zshrc'
alias ev='eval `ssh-agent` && ssh-add ~/.ssh/id_ed25519'

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
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

. "$HOME/.asdf/asdf.sh"
