#!/usr/bin/env fish

if [ (which task 2> /dev/null) ]
  echo "[+] taskwarrior already installed"
else
  sudo apt install -y taskwarrior
  echo "[+] taskwarrior installed"
end
