#!/usr/bin/env fish

if [ (which bluetoothctl 2> /dev/null) ]
  echo "[+] bluez already installed"
else
  sudo apt install -y bluez
  echo "[+] bluez installed"
end

