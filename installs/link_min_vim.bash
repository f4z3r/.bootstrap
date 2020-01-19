#!/usr/bin/env bash

DIR="$1"

INJECTION="
let s:bootstrap#nvim_init_file = '$DIR/nvim/init.vim'
if filereadable(s:bootstrap#nvim_init_file)
  source s:bootstrap#nvim_init_file
endif
"

echo "$INJECTION" >> $HOME/.config/nvim/init.vim
echo "$INJECTION" >> $HOME/.vimrc
