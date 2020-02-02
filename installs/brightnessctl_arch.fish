#!/usr/bin/env fish

if [ (which brightnessctl 2> /dev/null) ]
  echo "[+] brightnessctl already installed"
else
  sudo pacman -S --noconfirm brightnessctl
  echo "[+] brightnessctl installed"
end
