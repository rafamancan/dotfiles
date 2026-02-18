# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"

# PHP Composer vendor binaries
export PATH="./vendor/bin:$PATH"

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

# docker up file
dupf() {
  docker-compose -f "$1" up -d
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
alias sv='~/dotfiles-pv/sv.sh'
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
function phpc() {
  local versions=()
  local current_version=""

  # Get current PHP version
  current_version=$(php -v 2>/dev/null | head -n1 | grep -oE '[0-9]+\.[0-9]+' | head -1)

  # Find installed PHP versions via Homebrew
  for formula in $(brew list 2>/dev/null | grep -E '^php(@[0-9.]+)?$'); do
    if [[ "$formula" == "php" ]]; then
      # Get version of main php formula
      local ver=$(brew info php --json 2>/dev/null | grep -oE '"version": "[0-9]+\.[0-9]+' | head -1 | grep -oE '[0-9]+\.[0-9]+')
      versions+=("$ver")
    else
      # Extract version from php@X.Y
      local ver=$(echo "$formula" | sed 's/php@//')
      versions+=("$ver")
    fi
  done

  if [[ ${#versions[@]} -eq 0 ]]; then
    echo "Nenhuma versão do PHP encontrada via Homebrew."
    return 1
  fi

  echo "Versões de PHP disponíveis:"
  echo "----------------------------"

  local i=1
  for ver in "${versions[@]}"; do
    if [[ "$ver" == "$current_version" ]]; then
      echo "  $i) PHP $ver (atual)"
    else
      echo "  $i) PHP $ver"
    fi
    ((i++))
  done

  echo ""
  echo -n "Selecione uma versão (1-${#versions[@]}): "
  read choice

  if [[ ! "$choice" =~ ^[0-9]+$ ]] || [[ "$choice" -lt 1 ]] || [[ "$choice" -gt ${#versions[@]} ]]; then
    echo "Opção inválida."
    return 1
  fi

  local selected_version="${versions[$choice]}"

  echo ""
  echo "Trocando para PHP $selected_version..."

  # Unlink all PHP versions first
  for formula in $(brew list 2>/dev/null | grep -E '^php(@[0-9.]+)?$'); do
    brew unlink "$formula" 2>/dev/null
  done

  # Link selected version
  if [[ "$selected_version" == "$(brew info php --json 2>/dev/null | grep -oE '"version": "[0-9]+\.[0-9]+' | head -1 | grep -oE '[0-9]+\.[0-9]+')" ]]; then
    brew link php --force --overwrite
  else
    brew link "php@$selected_version" --force --overwrite
  fi

  echo ""
  echo "PHP alterado com sucesso!"
  php -v
}


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

# IDE layout: 4 panes (left-top large, left-bottom small, right-top large, right-bottom small)
ide() {
  local session="ide"
  local dir="$(pwd)"
  local cmd="$1"

  tmux kill-session -t "$session" 2>/dev/null

  tmux new-session -d -s "$session" -c "$dir"
  tmux split-window -h -p 50 -t "$session:0.0" -c "$dir"
  tmux split-window -v -p 50 -t "$session:0.1" -c "$dir"
  tmux split-window -v -p 20 -t "$session:0.0" -c "$dir"
  # pane 0: left-top  → nvim
  # pane 1: left-bottom → terminal (empty)
  # pane 2: right-top  → ai
  # pane 3: right-bottom → codex
  tmux send-keys -t "$session:0.0" "nvim" Enter
  tmux send-keys -t "$session:0.2" "ai" Enter
  tmux send-keys -t "$session:0.3" "codex" Enter

  tmux select-pane -t "$session:0.0"
  tmux attach-session -t "$session"
}

# tmux attach
function ta {
  tmux a -t "$1"
}

# tmux new session
function tn {
  tmux new -s "$1"
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
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/rmancan/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
