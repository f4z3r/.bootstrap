#!/usr/bin/env fish

if [ (which powertop 2> /dev/null) ]
  echo "[+] powertop already installed"
else
  sudo apt install -y powertop
  echo "[+] powertop installed"
end
