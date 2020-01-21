#!/usr/bin/env fish

if [ (which clang-format 2> /dev/null) ]
  echo "[+] clang-format already installed"
else
  sudo apt install -y clang-format
  echo "[+] clang-format installed"
end

