#!/usr/bin/env bash

set -e

# Ativa os daemons
echo -e "[+] Ativando os Daemons\n"
sudo systemctl enable --now greetd.service
sudo systemctl unmask firewalld
sudo systemctl enable --now firewalld
sudo systemctl enable --now sshd
sudo systemctl enable --now tailscaled

# Syncthing (user-level)
sudo loginctl enable-linger leo
systemctl --user enable --now syncthing.service
