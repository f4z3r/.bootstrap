#!/usr/bin/env fish

if [ (which timew 2> /dev/null) ]
  echo "[+] timewarrior already installed"
else
  sudo pacman -S --noconfirm timewarrior
  echo "[+] timewarrior installed"
end
