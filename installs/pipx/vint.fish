#!/usr/bin/env fish

if [ (which vint 2> /dev/null) ]
  echo "[+] vint already installed"
else
  pipx install vim-vint
  echo "[+] vint installed"
end

