#!/usr/bin/env fish

if [ (which python3 2> /dev/null) ]
  echo "[+] python3 already installed"
else
  sudo apt install python3
  echo "[+] python3 installed"
end

