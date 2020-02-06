#!/usr/bin/env fish

if [ (which node 2> /dev/null) ]
  echo "[+] node already installed"
else
  sudo apt install -y nodejs
  echo "[+] node installed"
end
