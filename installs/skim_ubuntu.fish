#!/usr/bin/env fish

if [ (which sk 2> /dev/null) ]
  echo "[+] skim already installed"
else
  echo "[-] skim installation skipped. Please install skim by hand."
end
