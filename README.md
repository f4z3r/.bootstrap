# Bootstrap

Bootstrap my entire setup.

This fully supports both Arch linux and Ubuntu.

## Dependencies

The two dependencies for the bootstrap are `make` and `bash`.

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

The minimal boostrap will install:

- full Vim setup.
- full fish configuration.
- full git configuration.

Run it using

    make min

## Super Minimal

The super minimal bootstrap will bootstrap a full Vim setup and nothing more. Note this still
install quite some packages, such as `python3`, several language servers, `fzf`, etc.

Run it using:

    make super

This will not change the git configuration, or fish configuration. It's ment as a quick IDE
setup when time is of the essence. Should the target machine be affected as little as
possible, this is still undesirable.
