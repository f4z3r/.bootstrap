#!/usr/bin/env fish

if [ (which bluetoothctl 2> /dev/null) ]
  echo "[+] bluez already installed"
else
  sudo pacman -S --noconfirm bluez bluez-utils
  echo "[+] bluez installed"
end
