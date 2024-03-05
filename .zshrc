# PATHS
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/bin:$HOME/.config/composer/vendor/bin:$PATH"
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# OH-MY-ZSH PLUGINS
plugins=(
    git
    yarn
    zsh-autosuggestions
    zsh-wakatime
    colorize
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# ALIASES
source $HOME/dotfiles-pv/folders
source $HOME/dotfiles-pv/ssh

# DOCKER
alias dps="docker ps"
alias dup="docker-compose up -d"
alias ddown="docker-compose down"

# SYSTEM UTILS
alias vim="nvim"
alias vk='NVIM_APPNAME="nvim-kickstart" nvim'
alias v='NVIM_APPNAME="nvim-kickstart" nvim'
# alias v="nvim"
alias c="code ."
alias vf='cd ~/.config/nvim && v'
alias t="tmux"
alias bkp='cd && chmod +x .bkp-dot.sh && ./.bkp-dot.sh'
alias cl='xclip -sel clip'
alias ip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias fix='dotp && chmod +x fix.sh && ./fix.sh && cd'
alias port='lsof -i'
alias not='echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_watches
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_queued_events
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_instances
'
alias python='/usr/local/bin/python3.7'
alias ls='exa --icons'
alias cat='bat --style=auto'
alias so='source ~/.zshrc'
alias wip='git add . && git commit -m "wip"'
alias par='php artisan'
alias cf='composer fix'
alias cs='composer sniff'
alias zon='find . -name "*:Zone.Identifier" -type f -delete'
alias gc='git-cz'

# PERSONAL FUNCTIONS

# rebase commits
function rbs () {
  git rebase -i HEAD~$1
}

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

# deleting all branchs with prefixes feat/ and fix/
function cb () {
    if read -q "choice?Tem certeza que deseja deletar todas branchs com prefixo feat/ e fix/ ? (N/y): "; then
        echo
        git branch | grep -e "feat/" -e "fix/" | xargs git branch -D
    else
        echo
        echo "Cancelando.."
    fi
}

# docker bash
dex() {
  docker exec -it "$1" /bin/bash
}

# docker sh
dex2() {
  docker exec -it "$1" /bin/sh
}

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# NVM
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

source  $HOME/dotfiles-pv/gcp

eval "$(op completion zsh)"; compdef _op op

source $HOME/.agent-bridge.sh

eval "$(starship init zsh)"
ev
clear

PATH=~/.console-ninja/.bin:$PATH
