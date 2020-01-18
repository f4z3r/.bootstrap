#!/usr/bin/env fish

 if test -e tools/fzf/bin/fzf-tmux
   echo "[+] fzf already initialised"
 else
  git submodule update --init tools/fzf
  cd tools/fzf
  ./install --bin;
  if test -d ~/.fzf
    echo "[-] WARN: ~/.fzf already exists, deleting it"
    rm -rf ~/.fzf
  end
  ln -s (pwd)/ $HOME/.fzf
  echo "[+] fzf initialised"
end
