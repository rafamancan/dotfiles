#!/bin/bash
# Backup dos dotfiles
# - ~/dotfiles      → público  (branch: master)
# - ~/dotfiles-pv   → privado  (branch: main)

set -uo pipefail

Q="[\"']"
SECRET_RE="(sk-[A-Za-z0-9_-]{20,}"
SECRET_RE+="|ghp_[A-Za-z0-9]{30,}|gho_[A-Za-z0-9]{30,}|ghs_[A-Za-z0-9]{30,}"
SECRET_RE+="|github_pat_[A-Za-z0-9_]{20,}|glpat-[A-Za-z0-9_-]{15,}"
SECRET_RE+="|AKIA[0-9A-Z]{16}|ASIA[0-9A-Z]{16}"
SECRET_RE+="|xox[baprs]-[A-Za-z0-9-]{10,}|AIza[0-9A-Za-z_-]{35}"
SECRET_RE+="|-----BEGIN [A-Z ]*PRIVATE KEY-----"
SECRET_RE+="|(api[_-]?key|secret|token|passwd|password|passphrase|authorization)"
SECRET_RE+="${Q}?[[:space:]]*[:=][[:space:]]*${Q}[^\"']{8,}"
SECRET_RE+=")"

scan_staged() {
  local hits
  [ -n "${BKP_SKIP_SECRET_SCAN:-}" ] && { echo "scan pulado"; return 0; }

  hits=$(git diff --cached -U0 | grep -a '^+' | grep -aInE "$SECRET_RE")
  if [ -n "$hits" ]; then
    echo
    echo "!! ABORTADO — possível segredo no staged:"
    echo "$hits" | head -20
    echo
    echo "   Falso positivo? BKP_SKIP_SECRET_SCAN=1 bkp"
    return 1
  fi
  echo "scan: limpo"
  return 0
}

stage_allowlist() {
  local p
  for p in "$@"; do
    if [ -e "$p" ] || git ls-files --error-unmatch -- "$p" >/dev/null 2>&1; then
      git add -A -- "$p"
    fi
  done
}

# --------------------------------------------------------------------------
# Público
# --------------------------------------------------------------------------
cp ~/.zshrc ~/dotfiles/
cp ~/.tmux.conf ~/dotfiles/.tmux.conf 2>/dev/null
cp ~/.config/starship.toml ~/dotfiles/starship.toml 2>/dev/null

rsync -a --delete \
  --exclude '.claude/' \
  --exclude '.git/' \
  --exclude 'data/' \
  --exclude 'sessions/' \
  --exclude 'shada/' \
  --exclude '*.log' \
  ~/.config/nvim/ ~/dotfiles/nvim/ 2>/dev/null

rsync -a --delete \
  --exclude 'automatic_backups/' \
  ~/.config/karabiner/ ~/dotfiles/karabiner/ 2>/dev/null

mkdir -p ~/dotfiles/ghostty && cp ~/.config/ghostty/config ~/dotfiles/ghostty/config 2>/dev/null
mkdir -p ~/dotfiles/herdr && cp ~/.config/herdr/config.toml ~/dotfiles/herdr/config.toml 2>/dev/null

cp ~/wterm-keys.json ~/dotfiles/wsl/wterm-keys.json 2>/dev/null

cp ~/.bkp-dot.sh ~/dotfiles/

# --------------------------------------------------------------------------
# Privado
# --------------------------------------------------------------------------
cp ~/.gitconfig ~/dotfiles-pv/.gitconfig
cp ~/.ssh/config ~/dotfiles-pv/config

CLAUDE_SRC="$HOME/.claude"
CLAUDE_DST="$HOME/dotfiles-pv/claude"
mkdir -p "$CLAUDE_DST"

cp "$CLAUDE_SRC/CLAUDE.md"           "$CLAUDE_DST/"           2>/dev/null
cp "$CLAUDE_SRC/settings.json"       "$CLAUDE_DST/"           2>/dev/null
cp "$CLAUDE_SRC/settings.local.json" "$CLAUDE_DST/"           2>/dev/null
cp "$CLAUDE_SRC/statusline.sh"       "$CLAUDE_DST/"           2>/dev/null

rsync -a --delete "$CLAUDE_SRC/agents/"   "$CLAUDE_DST/agents/"
rsync -a --delete "$CLAUDE_SRC/commands/" "$CLAUDE_DST/commands/"
rsync -a --delete "$CLAUDE_SRC/hooks/"    "$CLAUDE_DST/hooks/"
rsync -a --delete "$CLAUDE_SRC/scripts/"  "$CLAUDE_DST/scripts/"

mkdir -p "$CLAUDE_DST/plugins"
cp "$CLAUDE_SRC/plugins/installed_plugins.json"  "$CLAUDE_DST/plugins/" 2>/dev/null
cp "$CLAUDE_SRC/plugins/known_marketplaces.json" "$CLAUDE_DST/plugins/" 2>/dev/null

# --------------------------------------------------------------------------
# Commit & push
# --------------------------------------------------------------------------
# Config nova no repo público? Declare aqui, senão não é commitada.
PUB_PATHS=(
  .bkp-dot.sh
  .gitignore
  .luarc.json
  .p10k.zsh
  .tmux.conf
  .zshrc
  LICENSE
  README.md
  starship.toml
  fonts
  ghostty
  herdr
  karabiner
  nvim
  terms
  wsl
)

cd ~/dotfiles || exit 1
stage_allowlist "${PUB_PATHS[@]}"
scan_staged || exit 1

dt=$(date '+%d/%m/%Y %H:%M:%S')
git commit -m "updating $dt" || true
git push -u origin master || exit 1

cd ~/dotfiles-pv || exit 1
git add .

dtp=$(date '+%d/%m/%Y %H:%M:%S')
git commit -m "updating private $dtp" || true
git push -u origin main || exit 1

echo "________________________________________________"
echo "Atualização realizada: $dt"
echo "Atualização realizada privado: $dtp"
echo "________________________________________________"
