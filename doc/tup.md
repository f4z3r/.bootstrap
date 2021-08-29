# Tup

Simple and very fast file-based build system.

> Replacement for `make`.

## Limitations

`tup` cannot create files outside of its build hierarchy. Therefore it cannot for instance be used
as a replacement for the setup of this project. Moreover, `tup` tends to require a `Tupfile` per
directory, as it _should_ only create files in the same directory as the `Tupfile` resides (while it
can reference any files in the build hierarchy as inputs). It is truly meant as a build system, and
less as an installation mechanism as make is used here.

Moreover it does not support `.PHONY` targets. That makes it more of a complement to `make` than a
replacement, since actions such as installation and cleaning cannot be taken care of by `tup`.

## Installation

`tup` can be installed directly from `pacman`.


## Usage

### Initialization

Initialize a project with `tup init` in the project root.

### Rules

```tup
: hello.c |> gcc hello.c -o hello.o |> hello.o
: spare.c |> gcc spare.c -o spare.o |> spare.o
```

These are `:-rule` which define how a source file can be turned into a target file. It can use
abbreviations such as `%f` for the inputs, `%o` for the outputs, and `%B` for the basename of the
input. Therefore the rules above can be turned into the following:

```tup
: hello.c |> gcc %f -o %o |> %B.o
: spare.c |> gcc %f -o %o |> %B.o
```

Note that the rules are the same, for this `tup` provides additional functions:

```tup
: foreach *.c |> gcc %f -o %o |> %B.o
```

which will take all C files in the current directory to build them _individually_.

### Variables

Variables can be defined like shell variables and referenced with `$(VAR)`.

### Rule Imports

You can define rules in `Tuprules.tup` files and include them using `include_rules`. Such rules are
defined with a bang and are then referenced. For instance:

`Tupfile`:

```tup
include_rules
CFLAGS += -Inewmath
: foreach *.c |> !cc |>
: *.o newmath/libnewmath.a |> gcc %f -o %o |> hello
```

`Tuprules.tup`:

```tup
CFLAGS += -Wall
CFLAGS += -O2

!cc = |> gcc $(CFLAGS) -c %f -o %o |> %B.o
```
