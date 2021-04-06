# Tools

This documents what tools we prefer, where to find them, and what they are used for. It does not
detail the installation and configuration. This can potentially be found under `./doc/`.

All applications should if possible be installed in the following order of preference:

1. version management system if this makes sense. This is the case if we want multiple versions to
  run in parallel on the PC. This is especially the case for languages. However, note that this does
  not imply that no version can be installed on the system via a package manager.
2. Via the `pacman` package manager.
3. Via the `yay` package manager.
4. Via any other package manager (such as `pipx`, etc).
5. Via an unique installation option.


## Editors

`neovim` in all its glory. The ins-and-outs is found throughout this repository.

## Languages

### Scripting

- `lua` and `luaJIT`: this is due to its speed and simplicity. Moreover, it is easily integrated
  into C/C++, Rust, etc. Finally, it is used to configure `awesome` which we extensively use.
- `python`: Due to its global use.
- `viml`: for configuration of `neovim`. Note however that `neovim` can be more and more configured
  using `lua`.

### Compiled

- `rust`: speed and safety. Modern dependency management and upcoming language. Simply beautifully
  designed.
- Whatever we use professionally.

## Building

- `xmake` with `ninja` backend: this is simple, fast, and cross-platform. It can compile C, C++,
  Rust, Golang, ...
- `make`: for simple use-cases. We do not use raw `ninja` because it goes against its philosophy.

## Version Management

- `asdf`: this can manage multiple versions for not only languages but also applications. We use it
  for `lua`, `luaJIT`, `mc`, and more.

## Virtualization

- `podman`: running containers and managing them. This is more feature rich than `docker`.
- `buildah`: to have more control over how images are built.
- `dive`: for image inspection.
- `qemu`: if virtual machine virtualization is needed. This is faster than `virtualbox` and offers
  CLI integration.

## Isolation

## Emulation

- `tmux`: for all emulation. This is highly integrated into the `neovim` setup. `screen` can
  alternatively be used if connecting to remote server that have no `tmux`.
