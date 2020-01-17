#!/usr/bin/env fish

if [ (which nvim 2> /dev/null) ]
  echo "[+] nvim already installed"
else
  sudo apt install -y neovim
  echo "[+] nvim installed"
end

