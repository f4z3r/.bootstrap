#!/usr/bin/env bash

if [ $(which fish 2> /dev/null) ]; then
  echo "[+] fish already installed"
else
  sudo pacman -S --noconfirm fish
  curl -L https://get.oh-my.fish | fish
  fish -c "omf install bobthefish"
  echo "[+] fish installed"
fi
