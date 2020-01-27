#!/usr/bin/env bash

 if [ -e tools/fzf/bin/fzf-tmux ]; then
   echo "[+] fzf already initialised"
 else
  git submodule update --init --depth 1 tools/fzf
  cd tools/fzf
  ./install --bin;
  if [ -d ~/.fzf ]; then
    echo "[-] WARN: ~/.fzf already exists, deleting it"
    rm -rf ~/.fzf
  fi
  ln -s $(pwd)/ $HOME/.fzf
  echo "[+] fzf initialised"
fi
