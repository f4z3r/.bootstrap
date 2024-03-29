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

## Troubleshooting

If executing `autorandr` results in an error because a resolution is not available, run the
following:

```sh
gft <height> <width> <freq>                 # obtain modeline (first entry is mode name)
xrandr --newmode <modeline>                 # create mode
xrandr --addmode <output> <mode-name>       # add mode to output source
xrandr --output <output> --mode <mode-name> # activate the mode
```

## Changing Resolution

```sh
# get IDs of the connected displays
xrandr | grep -w connected
# then set new resolution
xrandr --output <ID> --mode 5120x1440
```

## Changing Scaling

You can scale your output of a specific monitor by using:

```sh
xrandr --output <ID> --scale 1.5
```

> Note that a value of 1.5 will reduce the size of the displayed entities, while a value smaller
> than 1 will zoom in on the output.
