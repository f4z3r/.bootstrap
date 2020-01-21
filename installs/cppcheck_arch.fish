#!/usr/bin/env fish

if [ (which cppcheck 2> /dev/null) ]
  echo "[+] cppcheck already installed"
else
  sudo pacman -S --noconfirm cppcheck
  echo "[+] cppcheck installed"
end

