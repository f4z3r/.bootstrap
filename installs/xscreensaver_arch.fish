#!/usr/bin/env fish

if [ (which xscreensaver 2> /dev/null) ]
  echo "[+] xscreensaver already installed"
else
  sudo pacman -S --noconfirm xscreensaver
  echo "[+] xscreensaver installed"
end

