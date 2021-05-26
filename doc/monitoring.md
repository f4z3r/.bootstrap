# Monitoring

## Tools

- `ytop`: more beautiful `top` (see [utils.dm](./utils.md)).
- `nvtop`: `htop` for NVidia card.
- `glances`: full system monitoring.

## Prometheus

Install `prometheus`, `prometheus-node-exporter`, and `grafana` using `pacman`.

Then ensure the `/etc/prometheus/prometheus.yml` is correct. This can be achieved using:

```bash
promtool check config /etc/prometheus/prometheus.yml
```

When exporting metrics from the node exporter, this needs to be configured using the following under
`scrape_config` in the configuration file:

```yaml
- job_name: node
  static_configs:
    - targets: ["localhost:9100"]
```


The following services are then disabled by default:

- `prometheus`
- `prometheus-node-exporter`
- `grafana`

If you want to use the services, start them. However, they consume power in the background and
should therefore not run by default. In the current setup, they are represented in the awesome
`systemctl` widget.

### Grafana

You should be able to access Grafana on `localhost:3000`.

The default credentials are `admin:admin`.

When login in the first time, add a Prometheus data source. This should be on address
`localhost:9090` by default.

#### Dashboard

The dashboard ID `1860` provides very good insights into the nodes.

## AlertManager

AlertManager allows to provide alerts on the system monitoring from Prometheus. We do not install
this by default, as it is pointless for a private system. However, this can be easily installed
using `pacman` and configured in the `/etc/prometheus/prometheus.yml` file if necessary.
