#!/usr/bin/env bash

if [ $(which fish 2> /dev/null) ]; then
  echo "[+] fish already installed"
else
  sudo pacman -S --noconfirm fish
  echo "[+] fish installed"
fi
