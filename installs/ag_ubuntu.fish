#!/usr/bin/env fish

if [ (which ag 2> /dev/null) ]
  echo "[+] the_silver_searcher already installed"
else
  sudo apt install -y silversearcher-ag
  echo "[+] the_silver_searcher installed"
end

