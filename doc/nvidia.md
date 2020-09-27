# NVidia

<!-- vim-markdown-toc GFM -->

* [Check Current Graphics Renderer](#check-current-graphics-renderer)
* [Installation](#installation)
* [Usage](#usage)
* [Configuration](#configuration)

<!-- vim-markdown-toc -->

## Check Current Graphics Renderer

```sh
glxinfo | grep "OpenGL renderer"
```

should provide with the current graphics renderer.

## Installation

> This only works on Manjaro.

Checks that your graphics device is found:

```sh
inxi -G
```

Then check available NVidia drivers with

```sh
mhwd -l
```

and install the desired one:

```sh
sudo mhwd -i pci video-nvidia-450xx
```

If the install fails, it might be due to an unsupported kernel. To fix this, upgrade the kernel via
Manjaro's settings manager.

Then install `optimus-manager` and reboot. Also install `nvtop` to manage graphic card load.

Try a switch and check that the proprietary driver `nvidia` is used with `inxi -G` instead of the
`nouveau` driver.

## Usage

Run

```sh
# to switch to the Nvidia GPU
optimus-manager --switch nvidia
# to switch to the Intel GPU and power the Nvidia GPU off
optimus-manager --switch intel
# to switch to the Intel GPU but leave the Nvidia GPU available for on-demand offloading, similar to
# how Optimus works on Windows. See the Wiki for more details.
optimus-manager --switch hybrid
```

> WARNING : Switching mode automatically logs you out, so make sure you save your work and close all
> your applications before doing so.

## Configuration

To link the default configuration, run:

```sh
sudo ln -s ~/.bootstrap/conf/optimus-manager.conf /etc/optimus-manager/optimus-manager.conf
```

The default settings use `nouveau` to disable the GPU when in `intel` mode. However, newer GPUs
support builtin NVidia power management support from the driver. For this to work, follow [the
official
guide](https://download.nvidia.com/XFree86/Linux-x86_64/435.17/README/dynamicpowermanagement.html)
and set the power saving settings back from `nouveau` to `none`.
