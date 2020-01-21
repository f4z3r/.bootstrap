#!/usr/bin/env fish

if [ (which uncrustify 2> /dev/null) ]
  echo "[+] uncrustify already installed"
else
  sudo apt install -y uncrustify
  echo "[+] uncrustify installed"
end

