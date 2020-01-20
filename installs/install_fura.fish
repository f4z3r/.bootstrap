#!/usr/bin/env fish

if test -e tools/nerd-fonts/install.sh
  echo "[+] Fura Code already initialised"
else
  git submodule update --init tools/nerd-fonts
  cd tools/nerd-fonts
  ./install.sh FiraCode
  echo "[+] Fura Code initialised"
end

