# i3 with Xfce

> Taken from https://feeblenerd.blogspot.com/2015/11/pretty-i3-with-xfce.html

## Ubuntu Switch

In order to make this work on Ubuntu, install Xubuntu first.

## Setup

Install the `nitrogen` background image manager. Unfortunately, `xfdesktop` does not play well with
`i3`. Open the application and in the preferences, add:

```
/usr/share/backgrounds/
/usr/share/xfce4/backdrop   # might not be available
```

to the folders for background images.

Install `i3`.

Go into "Session and Startup" and change `xfwm4` and `xdesktop` to "Never" in the current session
and store the session. In "Application Autostart" add `i3`. Open keyboard settings and remove all
"Application Shortcuts".

### Configuration

Link the `i3` configuration:

```bash
mkdir ~/.i3
ln -s ~/.bootstrap/conf/i3 ~/.i3/config        # on ubuntu
ln -s ~/.bootstrap/conf/i3 ~/.config/i3/config # on arch
```

Restart the laptop and re-login.
