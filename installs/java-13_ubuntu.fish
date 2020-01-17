#!/usr/bin/env fish

set INSTALLED "yes"
if [ (string match "*openjdk 13.0*" (java --version)) ]
  set INSTALLED "yes"
else
  set INSTALLED "no"
end

if [ $INSTALLED = "yes" ]
  echo "[+] java-13 already installed"
else
  sudo apt install -y openjdk-13-jdk
  echo "[+] java-13 installed"
end

