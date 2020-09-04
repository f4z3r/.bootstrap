FROM archlinux:latest

WORKDIR /root

# install dependencies
RUN pacman -Sy
RUN pacman --noconfirm -S \
      glibc \
      neovim \
      make \
      zsh-syntax-highlighting \
      zsh-theme-powerlevel10k \
      zsh-completions \
      zsh-autosuggestions \
      the_silver_searcher \ 
      skim \
      ctags \
      tree

# configure default shell
RUN chsh -s /usr/bin/zsh

# install FZF
COPY tools/fzf .bootstrap/tools/fzf
WORKDIR /root/.bootstrap/tools/fzf
RUN ./install --bin
RUN ln -s /root/.bootstrap/tools/fzf/ /root/.fzf

# configure
WORKDIR /root/.bootstrap/
COPY conf conf
COPY zsh zsh
COPY Makefile .
RUN mkdir /root/.config
RUN make configure-zsh
RUN make vim-minimal

WORKDIR /root/
