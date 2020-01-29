#!/usr/bin/env fish

if [ (which task 2> /dev/null) ]
  echo "[+] taskwarrior already installed"
else
  sudo pacman -S --noconfirm task
  echo "[+] taskwarrior installed"
end
