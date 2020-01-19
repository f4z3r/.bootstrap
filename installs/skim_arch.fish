#!/usr/bin/env fish

if [ (which sk 2> /dev/null) ]
  echo "[+] skim already installed"
else
  sudo pacman -S --noconfirm skim
  echo "[+] skim installed"
end
