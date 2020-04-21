# Bootstrap

Bootstrap my entire setup.

This fully supports both Arch linux and Ubuntu.

## Dependencies

The two dependencies for the bootstrap are `git`, `make` and `bash`.

## Configuring `pacman`

Configure pacman by running:

    make pacman

## Full Bootstrap

Before running the full setup, please make sure to have the correct information showing when
running

    make

Then, run the full boostrap:

    make full

## Minimal Boostrap

The minimal boostrap will install a full vim configuration. It will do so without affecting
already installed configurations. Note that it won't install a fish shell or configure git in
any way.

Run it using

    make min

## Additional Installs

### Nim

To install `choosenim` and the `nim` compiler use:

    make nim


## Full Setup Description

The full setup includes:

1. AwesomeWM as a window manager (with full support for Fira Code Nerd Font).
2. `neovim` for any form of editing. This uses the following external dependencies:
   - `bandit`: for security analysis of python code
   - `black`: python code formatter
   - `yapf`: python code formatter
   - `mypy`: python type checker
   - `pyls`: python language server
   - `reorder-python-imports`: python import sorter
   - `flawfinder`: security scanner for C/C++
   - `cpplint`: C/C++ linter
   - `cppcheck`: C/C++ static analyser
   - `clang-format`: C/C++ code formatter
   - `clangd`: C/C++ langauge server
   - `uncrustify`: C/C++/C#/D/Java/Pawn source code beautifier
   - `java-language-server`: Java language server
   - `proselint`: prose linter
   - `vale`: prose linter (deprecates `proselint` in the future)
   - `vint`: vimL linter
   - `yamllint`: yaml linter
   - `fzf`: fuzzy finder
3. `skim` for fuzzy finding on the entire machine.
4. `ag` for content grepping (also used by `neovim`).
5. `task` (TaskWarrior) for ToDo management (also used by `neovim`).
6. `timew` (TimeWarrior) for time management (also used by TaskWarrior).
7. `screen` for terminal multiplexing on remote machines.
8. `htop` for system monitoring.
9. `mupdf` for performant PDF traversal.
10. `nmcpcpp` as a music client.
11. `mpd` as a music server.
12. `fish` as a friendly shell.
13. `kitty` as a terminal emulator.
14. `xscreensaver` for screen locking.
15. `bluez` (and utils) for bluetooth device management.

> Many of these include other dependencies (such as `java-language-server` also installing
> OpenJDK 13 and Maven).

As optional software, the following is available:

1. `openconnect` as a VPN.
2. Power management tools:
   - `powertop`: for system power monitoring
   - `tlp`: for power saving configuration
   - `brightnessctl`: for brightness control
