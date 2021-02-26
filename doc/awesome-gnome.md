# Awesome GNOME

## Installation

Ensure all requirements from the README are installed, including `awesome`. Then clone the GitHub
repository from `SirJson`:

```bash
git clone https://github.com/SirJson/awesomewm-gnome.git
```

Follow the installation instructions. At the moment of writing, this includes installation of some
dependencies and a `make` call:

```bash
# assuming Ubuntu
sudo apt-get install gnome gnome-flashback gnome-icon-theme gnome-themes-extra make
sudo make install
```

## Configuration

When launching "Awesome GNOME" from the DM, you might get an error that `at_screen_connect` is nil.
This is due to an issue with the brightness widget. Comment it out in the `theme.lua` configuration
file for awesome, both the construction and the bindings in the wibox. Then the session should be
able to start without issues.

Based on the versions of the software running on the host, some widgets might not be fully
functional, such as the IP widget not showing the address. This can typically be fixed by
investigating the external behaviour of the commands that are called by the widgets.
