#!/usr/bin/env fish

if [ (which asdf 2> /dev/null) ]
  echo "[+] asdf already installed"
else
  git clone --depth 1 https://github.com/asdf-vm/asdf.git ~/.asdf
  cd ~/.asdf
  git checkout (git describe --abbrev=0 --tags)
  echo "[+] asdf installed"
end

