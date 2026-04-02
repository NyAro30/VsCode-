#!/bin/bash
# =============================================================
#  setup_goinfre.sh — Script d'initialisation goinfre (42)
#  A sourcer dans ~/.zshrc ou lancer manuellement
# =============================================================

GOINFRE="$HOME/goinfre"
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log()  { echo -e "${GREEN}[OK]${NC} $1"; }
warn() { echo -e "${YELLOW}[--]${NC} $1"; }

# --- 1. Créer les dossiers dans goinfre ---
rm -f "$GOINFRE/.vscode/extensions"
mkdir -p "$GOINFRE/.vscode/extensions"
mkdir -p "$GOINFRE/.config/Code"
mkdir -p "$GOINFRE/.var"
mkdir -p "$GOINFRE/.tarball-installations"

# --- 2. Fonction pour créer un lien symbolique proprement ---
make_link() {
    local target="$1"   # dans goinfre
    local link="$2"     # dans $HOME ou $HOME/.config

    if [ -L "$link" ]; then
        warn "Lien déjà présent : $link"
    elif [ -d "$link" ] || [ -f "$link" ]; then
        warn "$link existe (fichier/dossier réel), sauvegarde → ${link}.bak"
        mv "$link" "${link}.bak"
        ln -s "$target" "$link"
        log "Lien créé : $link → $target"
    else
        ln -s "$target" "$link"
        log "Lien créé : $link → $target"
    fi
}

# --- 3. Créer les liens symboliques ---
make_link "$GOINFRE/.vscode"       "$HOME/.vscode"
make_link "$GOINFRE/.config/Code"  "$HOME/.config/Code"
make_link "$GOINFRE/.var"          "$HOME/.var"

# --- 4. Réinstaller les extensions VS Code si manquantes ---
EXTENSIONS=(
    daltonmenezes.aura-theme
    dokca.42-ft-count-line
    github.copilot
    github.copilot-chat
    kube.42header
    ms-python.debugpy
    ms-python.python
    ms-python.vscode-pylance
    ms-python.vscode-python-envs
    ms-vscode.cmake-tools
    ms-vscode.cpp-devtools
    ms-vscode.cpptools
    ms-vscode.cpptools-extension-pack
    ms-vscode.cpptools-themes
    ms-vscode.makefile-tools
    pkief.material-icon-theme
    seyyedkhandon.firacode
)

if command -v code &>/dev/null; then
    INSTALLED=$(code --list-extensions 2>/dev/null)
    echo ""
    echo "🔌 Vérification des extensions VS Code..."
    for ext in "${EXTENSIONS[@]}"; do
        if echo "$INSTALLED" | grep -qi "^$ext$"; then
            warn "Déjà installée : $ext"
        else
            echo "  → Installation de $ext..."
            code --install-extension "$ext" --force &>/dev/null
            log "Installée : $ext"
        fi
    done
else
    warn "VS Code (code) non trouvé dans le PATH, extensions ignorées."
fi

echo ""
log "Setup goinfre terminé ! 🚀"
