# OpenVPN

## Installation

It should be installed by default. You can however install it from the `openvpn` and
`networkmanager-openvpn` packages.

## Configuration

You can write openVPN configurations into the `/etc/openvpn/client/` directory, and name it
`<connection>.conf`. The credentials can be put into the same folder, with username and password on
separate lines, naming the authentication file like the configuration file but with `.auth`
extension. Make sure the files are only `root` readable.

Make sure that the following line is contained in the VPN configuration:

```
auth-user-pass <connection>.auth
```

## Usage

The VPN can be started using:

```sh
sudo openvpn /etc/openvpn/client/<conf>
```

You might need to provide the credentials when connecting.

Another way to use the VPN is directly via `systemd`. Use the following to launch the VPN:

```sh
sudo systemctl start openvpn-client@<connection>
```

In case of issues make sure that you have the correct owners on the files being used. This user
tends to be the `openvpn` user.
