#!/usr/bin/env fish

if [ (which hie 2> /dev/null) ]
  echo "[+] HIE already initialised"
else
  git submodule update --init --recursive --depth 1 tools/hie
  cd tools/hie
  stack ./install.hs hie
  echo "[+] HIE initialised"
end
