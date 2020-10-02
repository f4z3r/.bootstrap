# `rclone`

Use `rclone` package from `pacman`.

## Usage

### Configure Google Drive

Initialize it using `rclone config`, and create a new `drive` type remote with scope type `1` and
all defaults.

### Configure OneDrive

Initialize it using `rclone config`, and create a new `onedrive` type remote with scope type `1` and
all defaults.

### Syncing

You can sync the drive to your local folder with:

```sh
rclone sync -i <gdrive-name>: /path/to/drive   # sync drive with local folder
rclone sync -i /path/to/drive <gdrive-name>:   # sync local folder with drive
```

Leave out the `-i` flag if you do not want to have interactive synchronization.

### Mounting

You can mount the drive directly to your filesystem using:

```sh
rclone mount --daemon <drive-name>: /path/to/mount/point
```

To unmount use:

```sh
fusermount -u /path/to/mount/point
```

### Listing Remotes

```sh
rclone listremotes --long
```

## Automount

Create the following `/etc/systemd/system/rclonemount.service` file:

> This assumes the remote is called `gdrive`, and that you want to mount it to
> `/home/jakob/ipt/shared/`.

```
[Unit]
Description=rclonemount
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
User=jakob
ExecStart=/usr/bin/rclone mount gdrive: /home/jakob/ipt/shared/ --config /home/jakob/.config/rclone/rclone.conf --checkers 16 --dir-cache-time 30m --quiet --timeout 30s
ExecStop=/usr/bin/fusermount -u /home/jakob/ipt/shared
Restart=on-abort

[Install]
WantedBy=multi-user.target
```

Run `sudo systemctl daemon-reload` and enable the service.
