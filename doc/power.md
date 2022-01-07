# Power Management

> See https://wiki.archlinux.org/index.php/Power_management

## Power

### TLP

`tlp` should be installed and enabled by default on Manjaro. It can be configured using the
`/etc/default/tlp` file, or via the `TLPUI` tool.

### Powertop

We will enable `powertop` as a service. This will force `powertop --auto-tune` to run automatically
on boot.

`powertop` should be calibrated once (`sudo powertop -c`), which will renter your laptop unusable
for a couple of minutes.

```bash
sudo sh -c "echo -e '[Unit]\nDescription=PowerTop\n\n[Service]\nType=oneshot\nRemainAfterExit=true\nExecStart=/usr/bin/powertop --auto-tune\n\n[Install]\nWantedBy=multi-user.target\n' > /etc/systemd/system/powertop.service"
sudo systemctl enable --now powertop.service
```

A report can also be generated using `powertop --html`, and viewed in the browser. Use `powertop` to
monitor power usage and configure your system to have better power usage.

## Thermals

Install `thermald` thermal management program and enable it with:

```bash
sudo systemctl enable --now thermald
```
