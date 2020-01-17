#!/usr/bin/env fish

if [ (which mvn 2> /dev/null) ]
  echo "[+] maven already installed"
else
  sudo apt install -y maven
  echo "[+] maven installed"
end
