#!/usr/bin/env bash

if [ $(command -v fish) ]; then
  echo "[+] fish already installed"
else
  sudo apt install -y fish
  curl -L https://get.oh-my.fish | fish
  fish -c "omf install bobthefish"
  chsh -s /usr/bin/fish
  sudo chsh -s /usr/bin/fish
  echo "[+] fish installed"
fi
