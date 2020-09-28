# Helm

Package manager for Kubernetes.

## Searching

Search for a package using

```sh
helm search hub mariadb
helm search repo mariadb    # if a repo is already installed
```

## Adding Repos

By default `helm` comes without any repositories set up. To add a repository use

```sh
helm repo add bitnami https://charts.bitnami.com/bitnami
```

This enables searching the repository, showing charts, and installing them. Note that once a
repository was added, it needs to be first updated with `repo update` before it can be used.

## Getting Information

In order to obtain a little more information on a chart use `show chart <chart>`. You can also
request the `readme`, `values`, or `all` instead of the `chart`

## Installing a Chart

Use

```sh
helm install <chart-name> <chart>
```

