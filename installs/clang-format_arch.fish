#!/usr/bin/env fish

if [ (which clang-format 2> /dev/null) ]
  echo "[+] clang-format already installed"
else
  sudo pacman -S --noconfirm clang
  echo "[+] clang-format installed"
end

