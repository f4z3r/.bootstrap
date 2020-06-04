# AutoRandR

## Installation

Install the `autorandr` package using `pacman`.


## Usage

Use Xfce environment to configure displays, then save the configuration using

```sh
autorandr --save <profile>
```

Then change back to awesome and load the profile using

```sh
autorandr --load <profile>
```

Common profiles can also be configured using

```sh
autorandr off|common|clone-largest|horizontal|vertical
```

> Note `--load` can be omitted.
