#!/usr/bin/env bash

set -e

# Diretórios/arquivos stow e seus alvos no $HOME
# Formato: "pacote_stow:caminho_alvo_relativo_ao_HOME"
STOW_PACKAGES=(
  "bash:.config/.bashrc"
  "dgop:.config/dgop"
  "dms:.config/DankMaterialShell"
  "fish:.config/fish"
  "foot:.config/foot"
  "git:.gitconfig"
  "hyprland:.config/hypr"
  "nvim:.config/nvim"
  "pavucontrol:.config/pavucontrol.ini"
  "qalculate:.config/qalculate"
  "ssh:.ssh/config"
  "starship:.config/starship.toml"
  "tmux:.config/tmux"
  "viewnior:.config/viewnior"
  "yazi:.config/yazi"
)

# Remove os alvos existentes
echo -e "[+] Removendo configs antigos...\n"
for entry in "${STOW_PACKAGES[@]}"; do
  target="${entry#*:}"
  rm -rf "$HOME/$target"
done

# Instala os dotfiles via stow
echo -e "[+] Instalando dotfiles...\n"
cd "$HOME/.dotfiles"
for entry in "${STOW_PACKAGES[@]}"; do
  package="${entry%%:*}"
  stow "$package"
done
