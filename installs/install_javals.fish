#!/usr/bin/env fish

if test -e nvim/lsps/java-language-server/README.md
  echo "[+] java LS already initialised"
else
  git submodule update --init --depth 1 nvim/lsps/java-language-server
  if [ ! -e /bin/jlink ]
    sudo ln -s /usr/bin/jlink /bin/jlink
  end
  cd nvim/lsps/java-language-server
  ./scripts/link_linux.sh
  mvn package -DskipTests
  echo "[+] java LS initialised"
end
