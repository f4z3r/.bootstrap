# Kubernetes

* [K3s Based Installation](#k3s-based-installation)
* [Minikube Based Installation](#minikube-based-installation)
  * [VirtualBox](#virtualbox)
  * [Minikube](#minikube)
* [Starting a Local Cluster](#starting-a-local-cluster)
  * [`k3d`](#`k3d`)
  * [Minikube](#minikube)
* [Additional Tools](#additional-tools)
  * [K9s](#k9s)
  * [Kubectx](#kubectx)
  * [Helm](#helm)

---

## K3s Based Installation

We will use the `k3s` in `docker` installation. As it runs in `docker`, `docker` needs to be
installed first. Then the `rancher-k3d-bin` package can be installed from the AUR.

## Minikube Based Installation

### VirtualBox

Install VirtualBox. On Manjaro, check which kernel is currently running using `mhwd-kernel -li`.
Then install `virtualbox` and the correct version of host modules:

```sh
sudo pacman -Syu virtualbox linux54-virtualbox-host-modules
```

Then reboot your system or run

```sh
sudo vboxreload
```

### Minikube

Then install `minikube` using `pacman`.


## Starting a Local Cluster

Install `kubectl` to control your cluster.

### `k3d`

Start the `docker` daemon and run:

```sh
k3d cluster create base --agents 2
```

The above command creates a cluster named `base` with 2 worker agents. Once the cluster is created,
it can be stopped and restarted with `k3d cluster stop base`.

### Minikube

To start the default local cluster using `minikube`, use:

```sh
minikube start
```

This will create a local cluster inside a VM called `minikube`. Use `minikube start -p <..>` to
start other named clusters.

Check that the cluster is running using `kubectl cluster-info`.

## Additional Tools

### K9s

A TUI for managing Kubernetes clusters and pods. Uses `vim` key bindings and uses command mode to
switch views. To add the configuration run:

```sh
mkdir -p $HOME/.k9s
ln -s $HOME/.bootstrap/conf/k9s/* $HOME/.k9s/
ln -s $HOME/.bootstrap/conf/k9s/dark_skin.yaml $HOME/.k9s/skin.yml
```

### Kubectx

A utility to manage and switch between `kubectl` contexts and Kubernetes namespaces. Contexts are
used to manage clusters. Use `kubectx` to check for all contexts, and add an argument to switch to
said context.

`kubectx` also includes a binary `kubens` that enables switching between Kubernetes namespaces. Its
usage is identical to `kubectx`.

### Helm

The Kubernetes package manager. Install its `helm` package via `pacman`.

### Other

See [Podman and Buildah documentation](./../podman-buildah.md).

### Stern

A multi-pod log tailing tools. Install `stern-bin` from the AUR.

### Krew

A package manager for `kubectl` extensions. Install `krew-bin` from the AUR.

To list the installed plugins, run `kubectl krew update` and then `kubectl krew list`.

#### Useful Extensions

- `fuzzy` enabled fuzzy searching on resources. Eg: `kubectl fuzzy exec -A -it -- bash`
- `tmux-exec` allows to exec into multiple pods at once. Eg: `kubectl tmux-exec -it -l app=nginx bash`
