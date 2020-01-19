#!/usr/bin/env fish

if [ (which screen 2> /dev/null) ]
  echo "[+] screen already installed"
else
  sudo apt install -y screen
  echo "[+] screen installed"
end


