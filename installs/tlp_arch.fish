#!/usr/bin/env fish

if [ (which tlp 2> /dev/null) ]
  echo "[+] tlp already installed"
else
  sudo pacman -S --noconfirm tlp
  sudo systemctl enable tlp
  sudo systemctl enable tlp-sleep
  echo "[+] tlp installed"
end
