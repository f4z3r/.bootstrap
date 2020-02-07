#!/usr/bin/env fish

if [ (which stack 2> /dev/null) ]
  echo "[+] stack already installed"
else
  curl -sSL https://get.haskellstack.org/ | sh
  echo "[+] stack installed"
end
