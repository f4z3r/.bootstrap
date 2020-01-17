#!/usr/bin/env fish

if [ (which nvim 2> /dev/null) ]
  echo "[+] nvim already installed"
else
  sudo pacman -S --noconfirm neovim
  pip install --user pynvim
  echo "[+] nvim installed"
end

