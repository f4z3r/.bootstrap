#!/usr/bin/env fish

if [ (which pip3 2> /dev/null) ]
  echo "[+] pip3 already installed"
else
  sudo apt install -y python3-pip
  echo "[+] pip3 installed"
end

