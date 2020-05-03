# Music

## Installation

Ensure all required programs are installed.

```sh
sudo pacman -S mpd ncmpcpp
```

The `mpc` client should already have been installed as a dependency to `awesome`.

## Configuration

Create the required directories for mpd.

```sh
mkdir -p ~/.config/mpd/
```

Link the configuration files.

```sh
sudo ln -s ~/.bootstrap/conf/mpd.conf /etc/mpd.conf
sudo ln -s ~/.bootstrap/conf/default.pa /etc/pulse/default.pa
sudo ln -s ~/.bootstrap/conf/client.conf /etc/pulse/client.conf
sudo ln -s ~/.bootstrap/conf/ncmpcpp ~/.ncmpcpp
```

Then restart `pulseaudio`.

```sh
pulseaudio -k       # NOT AS ROOT
pulseaudio --start
```

## Usage

Start the `mpd` service. Perform the troubleshoot when starting `mpd` right after an update or
install.

```sh
sudo systemctl start mpd
```

Launch `ncmpcpp` as a client to listen to music. Press `u` to update the database and import songs.

## Playlist synchrosization

Create a symbolic link to always sync playlists.

```sh
ln -s ~/.bootstrap/conf/playlists ~/.config/mpd/playlists
```

## Troubleshoot

Now remove the user in

    /usr/lib/systemd/system/mpd.service

to be `root`. Then restart `mpd` daemon:

```sh
sudo systemctl daemon-reload
sudo systemctl restart mpd
```
