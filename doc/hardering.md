# System Hardening

## Disable ICMP echo requests

> This means that your device will not respond to pings anymore. This makes finding your device more
> complicated. However, it may break services that need to ping your device.

Create and add a line in `/etc/sysctl.d/icmp-ignore.conf`

```
net.ipv4.icmp_echo_ignore_all=1
```

Then reload using `sysctl -p /etc/sysctl.d/icmp-ignore.conf`.

Moreover, when using `ufw`, change the value in `/etc/ufw/sysctl.conf` as well.

You can check this works by running `ping 127.0.0.1`. This should achieve 100% packet loss. Note
that you should not use `localhost`, as this tends to resolve to the IPv6 address `::1`, and the
`sysctl` setting only affects IPv4 requests.
