set shell := ["bash", "-c"]

dir := justfile_directory()
home := env_var('HOME')

configure: xsecurelock vim zsh tools bash kitty git awesome pinky pacman logind thesaurus ctags tmux pier luakit neomutt navi hoard broot rtx kanata tiny rbw

configure-root: zsh-root

@xsecurelock:
  sudo cp -u {{ dir }}/conf/xsecurelock /usr/lib/systemd/system-sleep/xsecurelock
  sudo chmod 664 /usr/lib/systemd/system-sleep/xsecurelock
  echo "[+] Configured xsecurelock on suspend wakeup"

backup:
  @[ -d /mnt/drive ] || sudo mkdir /mnt/drive
  sudo mount /dev/sda1 /mnt/drive
  rsync -vau --delete-after {{ home }}/Music/ /mnt/drive/music
  rsync -vau --delete-after --delete-excluded --exclude='**/.git/' --exclude='**/target/' {{ home }}/ipt/ /mnt/drive/ipt
  rsync -vau --delete-after --delete-excluded --exclude='**/.git/' --exclude='**/target/' {{ home }}/Documents/ /mnt/drive/docs

@pacman-mirrors:
  sudo pacman-mirrors -c Switzerland,Austria,Germany,Italy,Belgium
  echo "[+] Configured Pacman mirrorlist"

@ctags:
  [ -L {{ home }}/.config/ctags ] || ln -s {{ dir }}/conf/ctags {{ home }}/.config/ctags
  echo "[+] Linked ctags configuration"

@git:
  [ -L {{ home }}/.gitconfig ] || ln -s {{ dir }}/git/.gitconfig {{ home }}/.gitconfig
  [ -L {{ home }}/.gitignore ] || ln -s {{ dir }}/git/.gitignore {{ home }}/.gitignore
  [ -L {{ home }}/.config/git ] || ln -s {{ dir }}/git/git {{ home }}/.config/git
  [ -L {{ home }}/.config/git/active.conf ] || ln -s {{ dir }}/git/git/dark.conf {{ home }}/.config/git/active.conf
  echo "[+] Linked git configuration"

@zsh-root:
  [ -L /root/.zshrc ] || sudo ln -s {{ dir }}/zsh/.zshrc /root/.zshrc
  [ -L /root/.config/zsh ] || sudo ln -s {{ dir }}/zsh/zsh /root/.config/zsh
  echo "[+] Linked zsh root configuration"

@asdf:
  [ -d {{ home }}/.asdf ] || git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
  echo "[+] asdf is downloaded"

@rtx:
  [ -L {{ home }}/.config/rtx ] || ln -s {{ dir }}/conf/rtx {{ home }}/.config/rtx
  echo "[+] rtx is configured"

@zsh:
  [ -L {{ home }}/.zshrc ] || ln -s {{ dir }}/zsh/.zshrc {{ home }}/.zshrc
  [ -L {{ home }}/.config/zsh ] || ln -s {{ dir }}/zsh/zsh {{ home }}/.config/zsh
  [ -L {{ home }}/.config/starship.toml ] || ln -s {{ dir }}/conf/starship.toml {{ home }}/.config/starship.toml
  echo "[+] Linked zsh configuration"

@tmux:
  [ -d {{ home }}/.tmux/plugins ] || mkdir -p {{ home }}/.tmux/plugins
  [ -d {{ home }}/.tmux/plugins/tpm ] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  [ -L {{ home }}/.tmux.conf ] || ln -s {{ dir }}/conf/.tmux.conf {{ home }}/.tmux.conf
  echo "[+] Linked tmux configuration"

@tools:
  install -d /{{ home }}/.local/bin
  install {{ dir }}/zsh/zsh/utils/ytp {{ home }}/.local/bin/
  install {{ dir }}/zsh/zsh/utils/drawio {{ home }}/.local/bin/
  install {{ dir }}/zsh/zsh/utils/pass {{ home }}/.local/bin/
  install {{ dir }}/zsh/zsh/utils/glog-find-author {{ home }}/.local/bin/
  install {{ dir }}/zsh/zsh/utils/k9s-fblog.sh {{ home }}/.local/bin/
  install -d /{{ home }}/.local/share/man/man1
  install {{ dir }}/zsh/zsh/utils/ytp.1 /{{ home }}/.local/share/man/man1
  install {{ dir }}/zsh/zsh/utils/drawio.1 /{{ home }}/.local/share/man/man1
  echo "[+] Installed shell tools"

@pier:
  [ -L {{ home }}/.config/pier.toml ] || ln -s {{ dir }}/conf/pier.toml {{ home }}/.config/pier.toml
  echo "[+] Linked pier configuration"

@neomutt:
  [ -L {{ home }}/.config/neomutt ] || ln -s {{ dir }}/conf/neomutt {{ home }}/.config/neomutt
  echo "[+] Linked neomutt configuration"

@navi:
  [ -L {{ home }}/.config/navi ] || ln -s {{ dir }}/conf/navi {{ home }}/.config/navi
  [ -L {{ home }}/.cheats ] || ln -s {{ dir }}/cheats {{ home }}/.cheats
  echo "[+] Linked navi configuration"

@hoard:
  [ -L {{ home }}/.config/hoard ] || ln -s {{ dir }}/conf/hoard {{ home }}/.config/hoard
  echo "[+] Linked hoard configuration"

@bash:
  -[ -f {{ home }}/.bashrc ] && rm {{ home }}/.bashrc
  [ -L {{ home }}/.bashrc ] || ln -s {{ dir }}/conf/.bashrc {{ home }}/.bashrc
  echo "[+] Linked bash configuration"

@rbw:
  [ -d {{ home }}/.config/rbw/ ] || mkdir -p {{ home }}/.config/rbw
  [ -L {{ home }}/.config/rbw/config.json ] || ln -s {{ dir }}/conf/rbw.json {{ home }}/.config/rbw/config.json
  echo "[+] Configured rust bitwarden service"

@vim: install-dein link-ultisnips
  -mkdir -p {{ home }}/.pad-notes/
  -[ -d {{ home }}/.config/nvim ] && rm -rf {{ home }}/.config/nvim
  [ -L {{ home }}/.config/nvim ] || ln -s {{ dir }}/nvim/ {{ home }}/.config/nvim
  echo "[+] Linked vim configuration"

@awesome:
  -[ -d {{ home }}/.config/awesome ] && rm -rf {{ home }}/.config/awesome
  [ -L {{ home }}/.config/awesome ] || ln -s {{ dir }}/awesome/ {{ home }}/.config/awesome
  echo "[+] Linked awesome configuration"

@kitty:
  [ -d {{ home }}/.config/kitty/ ] || mkdir -p {{ home }}/.config/kitty
  [ -L {{ home }}/.config/kitty/kitty.conf ] || ln -s {{ dir }}/conf/kitty.conf {{ home }}/.config/kitty/kitty.conf
  [ -L {{ home }}/.config/kitty/kitty-colors ] || ln -s {{ dir }}/conf/kitty-colors {{ home }}/.config/kitty/kitty-colors
  [ -L {{ home }}/.config/kitty/active-theme.conf ] || ln -s {{ dir }}/conf/kitty-colors/gruvbox-material-dark-soft.conf {{ home }}/.config/kitty/active-theme.conf
  [ -f {{ home }}/.config/kitty/active-theme ] || echo "dark" > {{ home }}/.config/kitty/active-theme
  echo "[+] Linked kitty configuration"

@pacman:
  sudo cp -u {{ dir }}/conf/pacman.conf /etc/pacman.conf
  sudo chmod 664 /etc/pacman.conf
  echo "[+] Copied pacman configuration"

@logind:
  sudo cp -u {{ dir }}/conf/systemd/logind.conf /etc/systemd/logind.conf
  echo "[+] Copied logind configuration"

@kanata:
  [ -d {{ home }}/.config/systemd/user/ ] || mkdir -p {{ home }}/.config/systemd/user
  [ -L {{ home }}/.config/systemd/user/kanata.service ] || ln -s {{ dir }}/conf/kanata.service {{ home }}/.config/systemd/user/kanata.service
  echo "[+] Configured kanata service"

@tiny:
  [ -d {{ home }}/.local/log/tiny/ ] || mkdir -p {{ home }}/.local/log/tiny/
  [ -d {{ home }}/.config/tiny/ ] || mkdir -p {{ home }}/.config/tiny/
  [ -L {{ home }}/.config/tiny/config.yml ] || ln -s {{ dir }}/conf/tiny.yml {{ home }}/.config/tiny/config.yml
  echo "[+] Configured kanata service"

@broot:
  [ -d {{ home }}/.config/broot/ ] || mkdir -p {{ home }}/.config/broot
  [ -L {{ home }}/.config/broot/conf.hjson ] || ln -s {{ dir }}/conf/broot.hjson {{ home }}/.config/broot/conf.hjson
  [ -L {{ home }}/.config/broot/dark-gruvbox.hjson ] || ln -s {{ dir }}/conf/broot-dark-gruvbox.hjson {{ home }}/.config/broot/dark-gruvbox.hjson
  [ -L {{ home }}/.config/broot/verbs.hjson ] || ln -s {{ dir }}/conf/broot-verbs.hjson {{ home }}/.config/broot/verbs.hjson
  echo "[+] Linked broot configuration"

#### Installs

@thesaurus:
  mkdir -p ~/.vim/thesaurus
  if [ ! -f ~/.vim/thesaurus/mthesaur.txt ]; then \
    wget --quiet -c -O ~/.vim/thesaurus/mthesaur.txt https://www.gutenberg.org/files/3202/files/mthesaur.txt; \
    echo "[+] Downloaded thesaurus mthesaur"; \
  fi
  if [ ! -f ~/.vim/thesaurus/openoffice-data.zip ]; then \
    wget --no-check-certificate --quiet -c -O ~/.vim/thesaurus/openoffice-data.zip https://www.openoffice.org/lingucomponent/MyThes-1.zip; \
    mkdir -p ~/.vim/thesaurus/openoffice; \
    unzip -j ~/.vim/thesaurus/openoffice-data.zip -d ~/.vim/thesaurus/openoffice/ &> /dev/null; \
    echo "[+] Downloaded openoffice files"; \
  fi
  echo "[+] Downloaded thesaurus offline files"

@install-dein:
  sh tools/install-dein.sh ~/.cache/dein > /dev/null
  echo "[+] Dein installed"

@link-ultisnips:
  [ -d {{ home }}/.config/coc ] || mkdir -p {{ home }}/.config/coc
  -[ -d {{ home }}/.config/coc/ultisnips ] && rm -r {{ home }}/.config/coc/ultisnips
  [ -L {{ home }}/.config/coc/ultisnips ] || ln -s {{ dir }}/conf/ultisnips {{ home }}/.config/coc/ultisnips
  echo "[+] Snippets linked"

@vim-minimal:
  -[ -f {{ home }}/.vimrc ] && [ ! -f {{ home }}/.vimrc.bak ] && mv {{ home }}/.vimrc {{ home }}/.vimrc.bak && echo "[+] backup created"
  [ -L {{ home }}/.vimrc ] || ln -s {{ dir }}/conf/.vimrc {{ home }}/.vimrc && echo "[+] configuration linked"
  [ -d {{ home }}/.config/nvim ] || mkdir -p {{ home }}/.config/nvim
  [ -L {{ home }}/.config/nvim/init.vim ] || ln -s {{ home }}/.vimrc {{ home }}/.config/nvim/init.vim && echo "[+] configuration linked for nvim"

@zsh-minimal:
  -[ -f {{ home }}/.zshrc ] && [ ! -f {{ home }}/.zshrc.bak ] && mv {{ home }}/.zshrc {{ home }}/.zshrc.bak && echo "[+] backup created"
  [ -L {{ home }}/.zshrc ] || ln -s {{ dir }}/conf/.zshrc {{ home }}/.zshrc && echo "[+] configuration linked"
  [ -L {{ home }}/.config/starship.toml ] || ln -s {{ dir }}/conf/starship.toml {{ home }}/.config/starship.toml

@bash-minimal:
  -[ -f {{ home }}/.bashrc ] && [ ! -f {{ home }}/.bashrc.bak ] && mv {{ home }}/.bashrc {{ home }}/.bashrc.bak && echo "[+] backup created"
  [ -L {{ home }}/.bashrc ] || ln -s {{ dir }}/conf/.bashrc {{ home }}/.bashrc && echo "[+] configuration copied"
  [ -L {{ home }}/.config/starship.toml ] || ln -s {{ dir }}/conf/starship.toml {{ home }}/.config/starship.toml

@luakit:
  [ -d {{ home }}/.config/luakit ] || mkdir -p {{ home }}/.config/luakit
  [ -L {{ home }}/.config/luakit/rc.lua ] || ln -s {{ dir }}/conf/luakit/rc.lua {{ home }}/.config/luakit/rc.lua
  [ -L {{ home }}/.config/luakit/theme.lua ] || ln -s {{ dir }}/conf/luakit/theme.lua {{ home }}/.config/luakit/theme.lua
  echo "[+] Linked luakit configuration"

@pinky:
  [ -L {{ home }}/.Xmodmap ] || ln -s {{ dir }}/conf/.Xmodmap {{ home }}/.Xmodmap
