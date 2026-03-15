#!/usr/bin/env bash

set -e

# Atualização inicial e instalação de dependências base
echo -e "[+] Instalando dependências base\n"
sudo pacman -Syu --noconfirm base-devel git stow

# Instala o Paru se não estiver instalado
if ! command -v paru &>/dev/null; then
  echo -e "[+] Instalando paru..."
  git clone https://aur.archlinux.org/paru.git /tmp/paru
  cd /tmp/paru
  makepkg -si --noconfirm
  rm -rf /tmp/paru
  cd "$HOME"
fi

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Instalação de pacotes do repositório oficial
echo -e "[+] Instalando pacotes do repositório oficial...\n"
sudo pacman -S --needed --noconfirm - < "$DOTFILES_DIR/packages-arch.txt"

# Instalação de pacotes do AUR
echo -e "[+] Instalando pacotes do AUR...\n"
paru -S --needed --noconfirm - < "$DOTFILES_DIR/packages-AUR.txt"

# Instala o DankMaterialShell
echo -e "[+] Instalando o DankMaterialShell...\n"
curl -fsSL https://install.danklinux.com | sh
