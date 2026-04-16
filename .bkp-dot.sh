#!/bin/bash
# Backup dos dotfiles
# - ~/dotfiles      → público  (branch: master)
# - ~/dotfiles-pv   → privado  (branch: main)
#
# Para ~/.claude usa allowlist explícita: só entra no backup o que está listado
# aqui. Runtime/cache/histórico (projects/, telemetry/, file-history/,
# shell-snapshots/, history.jsonl, caches, sessions...) fica de fora.

# --------------------------------------------------------------------------
# Público
# --------------------------------------------------------------------------
cp ~/.zshrc ~/dotfiles/

cp -r ~/.config/nvim/ ~/dotfiles/nvim 2>/dev/null
cp ~/.tmux.conf ~/dotfiles/.tmux.conf 2>/dev/null
cp ~/.config/starship.toml ~/dotfiles/starship.toml 2>/dev/null
cp -r ~/.config/karabiner/ ~/dotfiles/karabiner 2>/dev/null

cp ~/wterm-keys.json ~/dotfiles/wterm-keys.json 2>/dev/null

cp ~/.bkp-dot.sh ~/dotfiles/

# --------------------------------------------------------------------------
# Privado
# --------------------------------------------------------------------------
cp ~/.gitconfig ~/dotfiles-pv/.gitconfig
cp ~/.ssh/config ~/dotfiles-pv/config

# ~/.claude — allowlist
CLAUDE_SRC="$HOME/.claude"
CLAUDE_DST="$HOME/dotfiles-pv/claude"
mkdir -p "$CLAUDE_DST"

# Arquivos soltos
cp "$CLAUDE_SRC/CLAUDE.md"           "$CLAUDE_DST/"           2>/dev/null
cp "$CLAUDE_SRC/settings.json"       "$CLAUDE_DST/"           2>/dev/null
cp "$CLAUDE_SRC/settings.local.json" "$CLAUDE_DST/"           2>/dev/null
cp "$CLAUDE_SRC/statusline.sh"       "$CLAUDE_DST/"           2>/dev/null

# Diretórios (mirror com --delete pra refletir remoções)
rsync -a --delete "$CLAUDE_SRC/agents/"   "$CLAUDE_DST/agents/"
rsync -a --delete "$CLAUDE_SRC/commands/" "$CLAUDE_DST/commands/"
rsync -a --delete "$CLAUDE_SRC/hooks/"    "$CLAUDE_DST/hooks/"
rsync -a --delete "$CLAUDE_SRC/scripts/"  "$CLAUDE_DST/scripts/"

# Só metadata dos plugins (quais estão instalados + marketplaces); binários
# dos plugins são reinstaláveis e não vão pro repo.
mkdir -p "$CLAUDE_DST/plugins"
cp "$CLAUDE_SRC/plugins/installed_plugins.json"  "$CLAUDE_DST/plugins/" 2>/dev/null
cp "$CLAUDE_SRC/plugins/known_marketplaces.json" "$CLAUDE_DST/plugins/" 2>/dev/null

# --------------------------------------------------------------------------
# Commit & push
# --------------------------------------------------------------------------
cd ~/dotfiles || exit
git add .
dt=$(date '+%d/%m/%Y %H:%M:%S')
git commit -m "updating $dt" || true
git push -u origin master

cd ~/dotfiles-pv || exit
git add .
dtp=$(date '+%d/%m/%Y %H:%M:%S')
git commit -m "updating private $dtp" || true
git push -u origin main

echo "________________________________________________"
echo "Atualização realizada: $dt"
echo "Atualização realizada privado: $dtp"
echo "________________________________________________"
