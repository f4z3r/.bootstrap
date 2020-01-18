#!/usr/bin/env fish

if test -e nvim/lsps/javals/README.md
  echo "[+] java LS already initialised"
else
  git submodule update --init nvim/lsps/javals
  if [ ! -e /bin/jlink ]
    sudo ln -s /usr/bin/jlink /bin/jlink
  end
  cd nvim/lsps/javals && scripts/link_linux.sh
  cd nvim/lsps/javals && mvn package -DskipTests
  echo "[+] java LS initialised"
end
