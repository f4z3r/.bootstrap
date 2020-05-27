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

### Exports

We will share an NFS root at `/srv/nfs` with multiple sub exports at `/srv/nfs/media` and
`/srv/nfs/books`.

First ensure the mount points exist, as the subsystems will be mounted there on the server for
security.

```sh
mkdir -p /srv/nfs/{media,books}
```

And add the following to `/etc/exports`:

```
/srv/nfs        10.12.20.108/24(ro,sync,crossmnt,fsid=0)
/srv/nfs/media  10.12.20.108/24(ro,sync)
/srv/nfs/books  10.12.20.108/24(ro,sync)
```

The networks identified above will be allowed to access the NFS files. Note this allows access to
the entire local network without authentication. As shown above, everything is provided as `ro`
(read-only) instead of `rw`.

Once this is performed, mount the points with:

```sh
mount --bind /path/to/media /srv/nfs/media
mount --bind /path/to/books /srv/nfs/books
```

Then update the NFS exports with `exportfs -arv` and view them with `exportfs -v`.

If the server is no enabled, start it:

```sh
sudo systemctl start nfs-server.service
```

To stop the server and cancel inner mounts, use:

```sh
sudo systemctl stop nfs-server.service
umount /srv/nfs/media
umount /srv/nfs/books
```

## Client

For the client, ensure the `nfs-client.target` is active, then mount the NFS via:

```sh
mount 10.12.20.108:/ /mountpoint/on/client
```

This can be made persistent with `fstab`:

```
10.12.20.108:/   /mountpoint/on/client   nfs   defaults,timeo=900,retrans=5,_netdev   0 0
```

The IP addresses can be replaced by hostnames from `/etc/hosts`.

The mount can be cancelled by finding the root mount:

```sh
sudo systemctl list-units | grep nfs
```

And stopping the main `.mount`.
