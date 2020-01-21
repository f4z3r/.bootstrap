#!/usr/bin/env fish

if [ (which cppcheck 2> /dev/null) ]
  echo "[+] cppcheck already installed"
else
  sudo apt install -y cppcheck
  echo "[+] cppcheck installed"
end

