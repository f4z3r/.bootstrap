# NFS

## Installation

Install the `nfs-utils` package if not installed already.

## Configuration

Ensure Network Time Protocol is enabled to synchronise system clocks. The easiest way to do this is
via `systemd-timesyncd.service`:

```sh
sudo systemctl start systemd-timesyncd.service
sudo systemctl enable systemd-timesyncd.service
```

and check that the clock is NTP synchronised with:

```sh
timedatectl status
```

Then add a list of exports in `/etc/exports` for NFS to export.

> Note this setup does not perform any authentication.

Consider this following example wherein:

- The NFS root is /srv/nfs.
- The export is /srv/nfs/music via a bind mount to the actual target /mnt/music.
