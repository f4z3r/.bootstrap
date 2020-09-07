# Kubernetes

<!-- vim-markdown-toc GFM -->

* [Installation](#installation)
  - [VirtualBox](#virtualbox)
  - [Minikube and Kubectl](#minikube-and-kubectl)
* [Starting a Local Cluster](#starting-a-local-cluster)
* [Additional Tools](#additional-tools)
  - [K9s](#k9s)
  - [Kubectx](#kubectx)
  - [Helm](#helm)

<!-- vim-markdown-toc -->

---

## Installation

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

### Minikube and Kubectl

Then install `minikube` and `kubectl` using `pacman`.


## Starting a Local Cluster

To start the default local cluster using `minikube`, use:

```sh
minikube start
```

This will create a local cluster inside a VM called `minikube`. Use `minikube start -p <..>` to
start other named clusters.

Check that the cluster is running using `kubectl cluster-info`.

## Additional Tools

### K9s

A TUI for managing Kubernetes clusters and pods.

<!-- TODO(@jakob):  -->

### Kubectx

A utility to manage and switch between `kubectl` contexts and Kubernetes namespaces.

<!-- TODO(@jakob):  -->

### Helm

The Kubernetes package manager.

<!-- TODO(@jakob):  -->
