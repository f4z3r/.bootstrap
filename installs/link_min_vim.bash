#!/usr/bin/env bash

DIR="$1"

INJECTION="
if filereadable('$DIR/nvim/init.vim')
  source $DIR/nvim/init.vim
endif
"

mkdir -p $HOME/.config/nvim/
echo "$INJECTION" >> $HOME/.config/nvim/init.vim
echo "$INJECTION" >> $HOME/.vimrc
