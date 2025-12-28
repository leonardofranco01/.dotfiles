#!/usr/bin/env bash

set -euo pipefail

# Instala os dotfiles
rm -rf ~/.config/.bashrc ~/.config/hypr ~/.config/dgop ~/.config/DankMaterialShell ~/.config/danksearch ~/.config/fish ~/.config/foot ~/.gitconfig ~/.config/nvim ~/.config/pavucontrol.ini ~/.config/qalculate ~/.ssh/config ~/.config/starship.toml ~/.config/viewnior ~/.config/yazi ~/.config/zellij
cd ~/.dotfiles
stow bash dgop dms dsearch fish foot git hyprland nvim pavucontrol qalculate ssh starship viewnior yazi zellij

