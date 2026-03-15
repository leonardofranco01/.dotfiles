#!/usr/bin/env bash

set -e

# Habilita e sincroniza greetd
echo -e "[+] Configurando DMS greeter...\n"
dms greeter enable
dms greeter sync

# Muda o shell para fish
echo -e "[+] Mudando shell para fish...\n"
chsh -s "$(which fish)"

# Ativa o tailscale
echo -e "[+] Ativando tailscale...\n"
sudo tailscale up
