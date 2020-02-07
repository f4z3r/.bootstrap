#!/usr/bin/env fish

if test -e tools/hie/stack.yaml
  echo "[+] HIE already initialised"
else
  git submodule update --init --recursive --depth 1 tools/hie
  cd tools/hie
  stack ./install.hs hie
  echo "[+] HIE initialised"
end
