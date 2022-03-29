# Bitwarden

## Installation

Install the CLI from `yay`: `bitwarden-cli`.

After installation, use `bw login` to login once with email and password. If prompted for an API
key client secret, go to https://vault.bitwarden.com/#/settings/account and get the secret
information.

## Usage

You can use `bwu` to unlock the vault, and `bwl` to lock it again.

Then use the configured script to copy username and password from the CLI:

```sh
pass
```

> Note this requires `fzf` as a dependency.
