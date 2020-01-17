#!/usr/bin/env fish

if [ (which pyls 2> /dev/null) ]
  echo "[+] pyls already installed"
else
  pipx install python-language-server
  pipx inject python-language-server pyls-black
  echo "[+] pyls installed"
end

