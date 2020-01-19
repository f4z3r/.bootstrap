#!/usr/bin/env fish

if [ (which ag 2> /dev/null) ]
  echo "[+] the_silver_searcher already installed"
else
  sudo pacman -S --noconfirm the_silver_searcher
  echo "[+] the_silver_searcher installed"
end

