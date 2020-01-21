#!/usr/bin/env fish

if [ (which uncrustify 2> /dev/null) ]
  echo "[+] uncrustify already installed"
else
  sudo pacman -S --noconfirm uncrustify
  echo "[+] uncrustify installed"
end

