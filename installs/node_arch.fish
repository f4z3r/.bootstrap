#!/usr/bin/env fish

if [ (which node 2> /dev/null) ]
  echo "[+] node already installed"
else
  sudo pacman -S --noconfirm nodejs
  echo "[+] node installed"
end
