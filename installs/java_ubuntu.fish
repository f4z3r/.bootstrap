#!/usr/bin/env fish

if [ (which java 2> /dev/null) ]
  echo "[+] java already installed"
else
  sudo pacman -S --noconfirm jdk-openjdk
  sudo apt install -y openjdk-13-jdk
  echo "[+] java installed"
end
