# OpenConnect

## Installation

By default `openconnect` should already be installed on Manjaro.

## Usage

Simply call as `root` with the domain to which to tunnel traffic.

```sh
sudo openconnect sslvpn.ethz.ch
```

### Authenticate Only

If you only want to authenticate but not connect:

```sh
sudo openconnect --authenticate sslvpn.ethz.ch
```

This will provide you with the cookie and fingerprint to be passed in

```sh
openconnect --cookie-on-stdin $HOST --servercert $FINGERPRINT
```

and provide `$COOKIE` on stdin.
