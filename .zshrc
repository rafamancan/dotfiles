# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

ZSH_THEME="robbyrussell"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# ALIASES
source $HOME/dotfiles-pv/folders
source $HOME/dotfiles-pv/vars
source $HOME/dotfiles-pv/pvalias
source $HOME/dotfiles-pv/ssh

# DOCKER
alias dps="docker ps"
alias dup="docker-compose up -d"
alias ddown="docker-compose down"

# SYSTEM UTILS
alias vim="nvim"
alias v='nvim'
alias vk='NVIM_APPNAME="nvim-kickstart" nvim'
alias vm='NVIM_APPNAME="nvim-minimax" nvim'
# alias v='NVIM_APPNAME="nvim-kickstart" nvim'
alias c="code ."
alias vf='cd ~/.config/nvim && v'
alias vfk='cd ~/.config/nvim-kickstart && v'
alias bkp='cd && chmod +x .bkp-dot.sh && ./.bkp-dot.sh'
alias cl='xclip -sel clip'
alias ip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias fix='dotp && chmod +x fix.sh && ./fix.sh && cd'
alias sv='dotp && chmod +x sv.sh && ./sv.sh'
alias port='lsof -i'
alias not='echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_watches
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_queued_events
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_instances
'
alias ls='eza --icons'
alias cat='bat --style=auto'
alias so='source ~/.zshrc'
alias wip='git add . && git commit -m "wip"'
alias gcl='git add . && git commit -m "chore: linters"'
alias par='php artisan'
alias pas='php artisan serve'
alias nrd='npm run dev'
alias cf='composer fix'
alias ct='composer test'
alias ctp='composer test:parallel'
alias cs='composer sniff'
alias zon='find . -name "*:Zone.Identifier" -type f -delete'
alias sail='bash vendor/bin/sail'
alias gc='npx czg'
alias lg='lazygit'
# changing php version
alias phpc='sudo update-alternatives --config php'


# neovim alternatives
alias avim="NVIM_APPNAME=astronvim nvim"

# PERSONAL FUNCTIONS

# rebase commits
function rbs () {
  git rebase -i HEAD~$1
}

# fix wips
function fwip () {
  # Contar o número de commits 'wip' no histórico
  count=$(git log --oneline --grep="wip" | wc -l)

  # Se houver commits 'wip'
  if [ "$count" -gt 0 ]; then
    # Exibir o número de commits a serem resetados
    echo "Você tem $count commits 'wip'."

    # Fazer o reset soft
    git reset --soft HEAD~$count
  else
    echo "Não há commits 'wip' no histórico."
  fi
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
    if read -q "choice?Tem certeza que deseja deletar todas branchs com prefixo feat/, fix/ e dependabot/ ? (N/y): "; then
        echo
        git branch | grep -e "feat/" -e "fix/" -e "dependabot/" | xargs git branch -D
    else
        echo
        echo "Cancelando.."
    fi
}

# TMUX
alias t="tmux"
alias tls="tmux ls"

# tmux attach
function ta {
  tmux a -t "$1"
}

# tmux new session
function tn {
  tmux new -s "$1"
}

# docker bash
dex() {
  docker exec -it "$1" /bin/bash
}

# docker sh
dex2() {
  docker exec -it "$1" /bin/sh
}

# docker get ip
dip(){
    docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$1"
}

# Update Neovim to stable version
vus() {
    echo "🔄 Updating Neovim to stable version..."
    wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz && \
    rm -Rf nvim-linux-x86_64 && \
    tar xzvf nvim-linux-x86_64.tar.gz && \
    rm nvim-linux-x86_64.tar.gz && \
    sudo rm -Rf /opt/nvim_bkp && \
    sudo mv /opt/nvim /opt/nvim_bkp && \
    sudo mv nvim-linux-x86_64 /opt/nvim && \
    sudo rm -Rf /usr/local/bin/nvim && \
    sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim && \
    echo "✅ Neovim stable version installed:" && \
    nvim --version
}

# Update Neovim to nightly version
vun() {
    echo "🌙 Updating Neovim to nightly version..."
    wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz && \
    rm -Rf nvim-linux-x86_64 && \
    tar xzvf nvim-linux-x86_64.tar.gz && \
    rm nvim-linux-x86_64.tar.gz && \
    sudo rm -Rf /opt/nvim_bkp && \
    sudo mv /opt/nvim /opt/nvim_bkp && \
    sudo mv nvim-linux-x86_64 /opt/nvim && \
    sudo rm -Rf /usr/local/bin/nvim && \
    sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim && \
    echo "✅ Neovim nightly version installed:" && \
    nvim --version
}

eval "$(starship init zsh)"
