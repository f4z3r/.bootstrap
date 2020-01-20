#!/usr/bin/env fish

if [ (which awesome 2> /dev/null) ]
  echo "[+] awesome already installed"
else
  sudo pacman -S --noconfirm dmenu mpc scrot unclutter xsel
  sudo pacman -S --noconfirm awesome
  echo "[+] awesome installed"
end

