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
