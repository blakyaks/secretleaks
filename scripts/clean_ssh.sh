#!/bin/bash
DIRECTORY_TO_SEARCH="/c/source/secretleaks"
SSH_FILES=("id_rsa" "id_dsa" "id_ecdsa" "id_ed25519" "known_hosts" "authorized_keys" "config" "ca.pem" "key.pem")

for file_name in "${SSH_FILES[@]}"; do
  find "$DIRECTORY_TO_SEARCH" -name ".git" -prune -o -name "$file_name" -type f -print -exec rm -f {} \;
done