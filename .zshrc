# PATHS
export PATH="/Users/local/bin:/Users/bin:$PATH"
export ZSH="/Users/rmancan/.oh-my-zsh"
export WORKSPACE_INSTALL_POWERLINE="/Users/local/bin/powerline/powerline/bindings/bash/powerline.sh"
export PATH="/Users/rmancan/.yarn/bin:$PATH"
export PATH="/Users/rmancan/.local/bin:$PATH"
export PATH="/Users/local/lib/nodejs/node-v12.18.3-linux-x64/bin:$PATH"
export PATH="$PATH:/Users/rmancan/.composer/vendor/bin"
export PATH="$PATH:/Users/rmancan/.cargo/bin"
export PATH="/System/Volumes/Data/Users/rmancan/.gem/ruby/2.6.0:$PATH"

# PHP
# export PATH="/opt/homebrew/opt/php@7.0/bin:$PATH"
# export PATH="/opt/homebrew/opt/php@7.0/sbin:$PATH"
export PATH="/opt/homebrew/opt/php@8.1/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.1/sbin:$PATH"
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

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Variables
export MYVIMRC="/Users/rmancan/.config/nvim/init.lua"

# THEME
ZSH_THEME="simple"

# PLUGINS
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
alias dres='cd ~/workspace/services/fenix-dockerize/dev && docker-compose restart'
alias dlog='cd ~/workspace/services/fenix-dockerize/dev && docker compose logs -t -f'
alias dps='docker ps'

# FOLDERS
alias ser='cd ~/workspace/services/'
alias api='cd ~/workspace/services/app-fenix'
alias ges='cd ~/workspace/services/manager-fenix'
alias con='cd ~/workspace/services/consultant-fenix'
alias poc='cd ~/workspace/services/POCS/'
alias per='cd ~/workspace/personal/'
alias vf='cd ~/.config/nvim && v'
alias api='cd ~/workspace/services/app-fenix'
alias doc='cd ~/workspace/services/fenix-dockerize'
alias chat='cd ~/workspace/services/chat-fenix'
alias tes='cd ~/workspace/personal/test'
alias mpoc='cd ~/workspace/personal/manager_poc'
alias bdj='cd ~/workspace/services/backend-dj'
alias fdj='cd ~/workspace/services/frontend-dj'

# ANDROID DEVELOPMENT UTILS
alias ya='yarn android --variant=developmentDebug  --appIdSuffix=dev'

# JS and TS DEVELOPMENT UTILS
alias ys='yarn start'
alias yd='yarn dev'
alias yb='yarn build'
alias yrm='rm -Rf node_modules/ yarn.lock package-lock.json yarn-error.log && yarn install'
alias yst='yarn storybook'
alias lint='./node_modules/eslint/bin/eslint.js src/ --fix'

# ELIXIR DEVELOPMENT UTILS
alias et='iex -S mix'

# PHP DEVELOPMENT UTILS
alias pas='php artisan serve'

# SYSTEM UTILS
alias vim="nvim"
alias v="lvim"
alias c="code-insiders ."
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

# generate ctags
function tags () {
  ctags -R --exclude=.git --exclude=node_modules
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function reset_trap {
  # Hacky hack because of <function/script-that-sets-trap-INT>
  trap - INT
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec reset_trap
export STARSHIP_CONFIG="$HOME/.config/starship.toml"
eval "$(starship init zsh)"

. /opt/homebrew/opt/asdf/libexec/asdf.sh
