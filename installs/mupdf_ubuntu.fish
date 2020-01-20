#!/usr/bin/env fish

if [ (which mupdf 2> /dev/null) ]
  echo "[+] mupdf already installed"
else
  sudo apt install -y mupdf
  xdg-mime default mupdf.desktop application/pdf
  echo "[+] mupdf installed"
end
