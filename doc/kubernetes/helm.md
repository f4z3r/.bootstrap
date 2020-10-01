# Helm

Package manager for Kubernetes.

* [Searching](#searching)
* [Adding Repos](#adding-repos)
* [Getting Information](#getting-information)
* [Installing a Chart](#installing-a-chart)
* [Hooks](#hooks)

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

## Hooks

Hooks allow the developer to intervene in a certain point in the life-cycle of a release.

Available hooks are:

- `pre-install`: Executes after templates are rendered, but before any resources are created in
  Kubernetes.
- `post-install`: Executes after all resources are loaded into Kubernetes.
- `pre-delete`: Executes on a deletion request before any resources are deleted from Kubernetes.
- `post-delete`: Executes on a deletion request after all of the release's resources have been
  deleted.
- `pre-upgrade`: Executes on an upgrade request after templates are rendered, but before any
  resources are updated.
- `post-upgrade`: Executes on an upgrade after all resources have been upgraded.
- `pre-rollback`: Executes on a rollback request after templates are rendered, but before any
  resources are rolled back.
- `post-rollback`: Executes on a rollback request after all resources have been modified.
- `test`: Executes when the Helm test subcommand is invoked (view test docs).

Hooks are just templates with special metadata annotations:

```yaml
metadata:
  annotations:
    "helm.sh/hook": post-install,post-upgrade
    "helm.sh/hook-weight": "-5"
    "helm.sh/hook-delete-policy": hook-succeeded,hook-failed
```

`helm.sh/hook` provides the type of hook. `helm.sh/hook-weight` allows to define a deterministic
hook order. Hook weight can be any integer, but must be represented as strings. When building an
order, `helm` will call them in ascending order. The `helm.sh/hook-delete-policy` determines when
hook resources will be deleted. Possible values are:

- `before-hook-creation`: delete the hook resources before another hook is created (default).
- `hook-succeeded`: delete when the hook successfully completed.
- `hook-failed`: delete when the hook failed during execution.
