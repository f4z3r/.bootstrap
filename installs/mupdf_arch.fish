#!/usr/bin/env fish

if [ (which mupdf 2> /dev/null) ]
  echo "[+] mupdf already installed"
else
  sudo pacman -S --noconfirm mupdf-gl
  echo "[+] mupdf installed"
end

