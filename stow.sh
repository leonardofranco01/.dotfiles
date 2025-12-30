#!/usr/bin/env bash

set -euo pipefail

# Instala os dotfiles
rm -rf $HOME/.config/.bashrc $HOME/.config/hypr $HOME/.config/dgop $HOME/.config/DankMaterialShell $HOME/.config/danksearch $HOME/.config/fish $HOME/.config/foot $HOME/.gitconfig $HOME/.config/nvim $HOME/.config/pavucontrol.ini $HOME/.config/qalculate $HOME/.ssh/config $HOME/.config/starship.toml $HOME/.config/viewnior $HOME/.config/yazi $HOME/.config/zellij
cd $HOME/.dotfiles
stow bash dgop dms dsearch fish foot git hyprland nvim pavucontrol qalculate ssh starship viewnior yazi zellij

