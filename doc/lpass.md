# LastPass

Cross-platform password manager.

<!-- vim-markdown-toc GFM -->

* [Installation](#installation)
* [Usage](#usage)

<!-- vim-markdown-toc -->

## Installation

Install the `lastpass-cli` tool from `pacman`.

## Usage

Login using `lpass login beckmann_jakob@hotmail.fr`.

Then you can use:

```sh
lpass ls [folder]                            # list all accounts
lpass add <folder>/<name>                    # add account <name> in <folder>
lpass generate <folder>/<name> <length>      # create account with automatically generated password
lpass show -p <name> | <folder>/<name>       # show password
lpass show -cp <name> | <folder>/<name>      # copy password to clipboard
lpass edit -u <name> | <folder>/<name>       # edit username of account
lpass move <name> | <folder>/<name> <folder> # move account to folder
lpass rm <name> | <folder>/<name>            # remove account
lpass sync                                   # sync with servers
lpass logout                                 # logout
```

In general, commands that take fields, such as `edit` and `add`, can take the `-u`, `-p`, `--url`,
`--notes` to specify field values. `generate` only takes `--username=USERNAME` and `--url=URL`
flags.
