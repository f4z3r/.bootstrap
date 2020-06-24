# Perl

## Installation

We do not use the system installation of `perl`. We isolate our own environment with `perlbrew`.
Install it with `pacman`, then run `perlbrew init`.

In general, we advise to install the `perl-blead` version and use a personal library named after the
user.

```sh
perlbrew install perl-blead
perlbrew lib create perl-blead@jakob
perlbrew switch perl-blead@jakob
```

## Tools

### Perlbrew

Manages different installations of `perl` in isolated environments.

```sh
perlbrew install perl-5.16.0           # install
perlbrew switch perl-5.16.0            # permanently use
perlbrew use perl-blead                # use in current shell
perlbrew lib create perl-5.16.0@jakob  # create personal library for jakob
perlbrew switch perl-5.16.0@jakob      # use permanently with personal library
perlbrew lib list                      # list libraries
perlbrew available --all               # list all available versions
perlbrew info                          # list information for perlbrew
```

### Perl::Critic

Install using `cpan -I`.

### Perl::Tidy

Install using `cpan -I`.
