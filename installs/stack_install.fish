#!/usr/bin/env fish
#
set COMMAND $argv[1]

if [ (which $COMMAND 2> /dev/null) ]
  echo "[+] $COMMAND already installed"
else
  stack install $COMMAND
  echo "[+] $COMMAND installed"
end
