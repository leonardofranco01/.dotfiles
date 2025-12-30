#!/usr/bin/env bash

# Função para criação segura de chaves SSH (apenas se não existirem)
generate_ssh_key() {
  local key_path="$1"
  shift
  local key_type="$1"
  shift
  local key_comment="$1"
  shift
  local key_bits="${1:-}" # opcional (apenas RSA)

  # Verifica existência (privada ou pública)
  if [ -f "$key_path" ] || [ -f "$key_path.pub" ]; then
    echo "[!] Chave já existe, pulando: ${key_path##*/}"
    return 0
  fi

  echo "[+] Gerando chave: ${key_path##*/}"
  if [ "$key_type" = "rsa" ]; then
    ssh-keygen -t rsa -b "${key_bits:-4096}" -C "$key_comment" -f "$key_path" -N ""
  else
    ssh-keygen -t "$key_type" -C "$key_comment" -f "$key_path" -N ""
  fi
}

# Diretório .ssh
mkdir -p "~/.ssh"
chmod 700 "~/.ssh"

# Paths das chaves
PERSONAL_KEY="~/.ssh/personal"
CONPEC_KEY="~/.ssh/conpec"
UNICAMP_KEY="~/.ssh/unicamp"

echo -e "[+] Gerando chaves SSH (personal, conpec, unicamp)\n"
generate_ssh_key "$PERSONAL_KEY" ed25519 "leonardofrancosilva01@gmail.com"
generate_ssh_key "$CONPEC_KEY" ed25519 "leonardo.franco@conpec.com.br"
generate_ssh_key "$UNICAMP_KEY" rsa "l205007@dac.unicamp.br" 4096
