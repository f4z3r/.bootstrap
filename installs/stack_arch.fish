#!/usr/bin/env fish

if [ (which stack 2> /dev/null) ]
  echo "[+] stack already installed"
else
  sudo pacman -S --noconfirm stack
  echo "[+] stack installed"
end
