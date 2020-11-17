# Starship

`starship` is a cross-shell command prompt that run very fast. It can be more convenient than
`powerlevel10k` as it supports both zsh and bash.

* [Installation](#installation)
* [Configuration](#configuration)
  * [Adding Features](#adding-features)

## Installation

Installation can be done via a prebuilt binary:

```bash
curl -fsSL https://starship.rs/install.sh | bash
```

Or directly from source:

```bash
cargo install starship
```

## Configuration

For bash, add the following to the end of the `.bashrc` file:

```bash
eval "$(starship init bash)"
```

For Zsh, add:

```bash
eval "$(starship init zsh)"
```

### Adding Features

The configuration file is `~/.config/starship.toml`.

Link the file from the `.bootstrap` repository:

```bash
ln -s $HOME/.bootstrap/conf/starship.toml $HOME/.config/starship.toml
```
