#!/usr/bin/env fish

if [ (which java 2> /dev/null) ]
  echo "[+] java already installed"
else
  sudo pacman -S --noconfirm jdk-openjdk
  echo "[+] java installed"
end
