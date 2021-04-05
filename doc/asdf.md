# ASDF

## Installation

The installation should have been performed via the `make`. If this is not the case, it can be
installed as listed below.

### Clone Repository

```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
```

### Configure Shell

Add the following to your `.zshrc`:

```zsh
. $HOME/.asdf/asdf.sh
```

> This should already be configured in `zsh/path.zsh`.


## Usage

```bash
asdf plugin list                # list installed plugins
asdf plugin add <plugin>        # install plugin
asdf plugin update --all        # update all plugins
asdf install <name> <version>   # install a version for plugin <name>
asdf isntall <name> latest      # install latest version of plugin
asdf list <name>                # list install versions of plugin
asdf list all <name>            # list all available versions of plugin
asdf latest <name> [version]    # list latest stable version of plugin (with optional major version)
asdf global <name> <version>    # set global version
asdf local <name> <version>     # set local version (for current directory)
asdf shell <name> <version>     # set the version for the current shell
asdf current [name]             # view current version
asdf uninstall <name> <version> # remove version
asdf update                     # update asdf to latest stable release
```
