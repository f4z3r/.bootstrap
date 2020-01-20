#!/usr/bin/env fish

set INJECTION "
[Desktop Entry]
Version=1.0
Type=Application
Name=awesome
TryExec=awesome
Exec=awesome
"

if [ (which awesome 2> /dev/null) ]
  echo "[+] awesome already installed"
else
  sudo apt install -y dmenu mpc scrot unclutter xsel
  sudo apt install -y awesome
  sudo echo "$INJECTION" >> /usr/share/applications/awesome.desktop
  echo "[+] awesome installed"
end

