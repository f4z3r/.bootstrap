#!/usr/bin/env fish

if [ (which htop 2> /dev/null) ]
  echo "[+] htop already installed"
else
  sudo apt install -y htop
  echo "[+] htop installed"
end

