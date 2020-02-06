#!/usr/bin/env fish

if [ (which yarn 2> /dev/null) ]
  echo "[+] yarn already installed"
else
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt update && sudo apt install -y yarn
  echo "[+] yarn installed"
end
