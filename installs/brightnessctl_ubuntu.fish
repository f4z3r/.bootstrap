#!/usr/bin/env fish

if [ (which brightnessctl 2> /dev/null) ]
  echo "[+] brightnessctl already installed"
else
  sudo apt install -y brightnessctl
  echo "[+] brightnessctl installed"
end
