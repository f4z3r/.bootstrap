#!/usr/bin/env fish

if [ (which powertop 2> /dev/null) ]
  echo "[+] powertop already installed"
else
  sudo pacman -S --noconfirm powertop
  echo "[+] powertop installed"
end
