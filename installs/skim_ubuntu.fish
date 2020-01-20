#!/usr/bin/env fish

if [ (which sk 2> /dev/null) ]
  echo "[+] skim already installed"
else
  git clone --depth 1 https://github.com/lotabout/skim.git ~/.skim
  ~/.skim/install
  echo "[+] skim installed"
end
