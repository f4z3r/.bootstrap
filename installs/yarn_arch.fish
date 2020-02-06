#!/usr/bin/env fish

if [ (which yarn 2> /dev/null) ]
  echo "[+] yarn already installed"
else
  sudo pacman -S --noconfirm yarn
  echo "[+] yarn installed"
end
