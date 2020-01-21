#!/usr/bin/env fish

if [ (which pipx 2> /dev/null) ]
  echo "[+] pipx already installed"
else
  pip3 install --user pipx
  echo "[+] pipx installed"
end
