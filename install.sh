#!/usr/bin/env bash

set -e

echo -e "==========================================\n"
echo -e "  Arch Linux + Hyprland Setup Script\n"
echo -e "==========================================\n"
echo -e "  1. Pacotes (pacman + AUR + DMS)\n"
echo -e "  2. Dotfiles (stow)\n"
echo -e "  3. Daemons (systemd)\n"
echo -e "  4. Chaves SSH\n"
echo -e "  5. Pós-instalação (greeter, fish, tailscale)\n"
echo -e "==========================================\n"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/scripts"

confirm_and_run() {
  local description="$1"
  local script="$2"

  read -rp "[?] Executar: ${description}? [Y/n] " answer
  case "${answer,,}" in
    n|nao|não|no) echo -e "[-] Pulando: ${description}\n" ;;
    *) source "$script" ;;
  esac
}

confirm_and_run "Pacotes (pacman + AUR + DMS)" "$SCRIPT_DIR/packages.sh"
confirm_and_run "Dotfiles (stow)" "$SCRIPT_DIR/dotfiles.sh"
confirm_and_run "Daemons (systemd)" "$SCRIPT_DIR/daemons.sh"
confirm_and_run "Chaves SSH" "$SCRIPT_DIR/ssh.sh"
confirm_and_run "Pós-instalação (greeter, fish, tailscale)" "$SCRIPT_DIR/post-setup.sh"

echo -e "\n=========================================="
echo -e "  Setup completo!"
echo -e "==========================================\n"
