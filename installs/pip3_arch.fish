#!/usr/bin/env fish

if [ (which pip 2> /dev/null) ]
  echo "[+] pip3 already installed"
else
  sudo pacman -S --noconfirm python-pip
  echo "[+] pip3 installed"
end
