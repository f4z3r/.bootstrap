#!/usr/bin/env fish

if [ (which kitty 2> /dev/null) ]
  echo "[+] kitty already installed"
else
  sudo apt install -y kitty
  echo "[+] kitty installed"
end

