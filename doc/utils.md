# Utilities

This document list a set of alternatives to common linux commands and what their advantage is over
regular their regular counterpart.

* [tldr](#tldr)
* [fd](#fd)
* [bat](#bat)
* [exa](#exa)

## tldr

> Alternative to `man`.

Provides example based _short_ manual references for commands. It is client-server based, meaning
you can find manual pages for uninstalled commands, but require an internet connection.

> Installed via `pacman`.


## fd

> Alternative to `find`.

Uses simpler syntax than `find`, is significantly faster, has a better omission strategy, and
produces coloured output.

> Installed via `pacman`.


## bat

> Alternative to `cat` and `less`.

Can syntax highlight a lot of files. Uses `ncurses` to achieve a cleaner interface. Integrates with
`git` to show diff.

> Installed via `pacman`.


## exa

> Alternative to `ls`.

Has more colourful output. Integrates with `git` to show changes on long list.

> Installed via `pacman`.
