# Network

## Wifi

List network with:

```bash
nmcli d wifi list [--rescan yes]
```

Connect with:

```bash
nmcli d wifi connect <name> password <pw>
# or
nmcli d wifi connect <name> --ask
```

Reconnect with:

```bash
nmcli d wifi connect <name>
```

### Portal for Public Wifi

Use the IP `10.1.0.1` to access portals.


