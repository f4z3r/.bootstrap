#!/usr/bin/env bash

if [ $(which fish 2> /dev/null) ]; then
  echo "[+] fish already installed"
else
  sudo apt install -y fish
  echo "[+] fish installed"
fi

