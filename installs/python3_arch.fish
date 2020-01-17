#!/usr/bin/env fish

if [ (which python 2> /dev/null) ]
  echo "[+] python3 already installed"
else
  sudo pacman -S --noconfirm python
  echo "[+] python3 installed"
end
