# Podman and Buildah

These two tools provide very extensive and interesting replacements to `docker`.

They provide benefits such as:

- daemonless running containers
- rootless containers
- more fine grained control over builds and image commits

* [Podman](#podman)
  * [Rootless](#rootless)
    * [Crun](#crun)
    * [slirp4netns](#slirp4netns)
    * [Fuse-overlayfs](#fuse-overlayfs)
  * [Usage](#usage)
* [Buildah](#buildah)
  * [Usage](#usage)
* [Images](#images)
* [Best Practices](#best-practices)
* [Tooling](#tooling)
  * [Hadolint](#hadolint)
  * [Dive](#dive)
  * [Grype](#grype)
* [Troubleshooting](#troubleshooting)

## Podman

### Rootless

In order to run rootless containers, aka containers that only have the privileges from the user
running them, subordinate UIDs and GIDs can be used. Write the following in both `/etc/subuid` and
`/etc/subgid`, and modify the files to be readable by all (`sudo chmod 644 /etc/subuid`):

```
jakob:165536:65536
```

Or use:

```bash
sudo touch /etc/subgid /etc/subuid
sudo usermod --add-subuids 165536-231072 --add-subgids 165536-231072 jakob
sudo chmod 644 /etc/subuid
sudo chmod 644 /etc/subgid
```

This will set subordinate UIDs and GIDs for user `jakob` in `/etc/subuid` and `/etc/subgid`.

#### Crun

The default OCI runtime for podman is runC. However, runC does not support cgroup V2, which allows
non-privileged users to allocate memory and CPU resource limits.

In order to use it as the OCI runtime, install `crun`, and configure it under `runtime` in
`~/.config/containers/containers.conf` (or `/etc/containers/containers.conf` for global
configuration).

```
[engine]
runtime = "crun"
```

Moreover, in order to more easily use docker images, you can add the following to
`~/.config/containers/registries.conf`:

```
unqualified-search-registries = ["docker.io"]
```

#### slirp4netns

Install the `slirp4netns` package to allow user-mode networking.

#### Fuse-overlayfs

Ensure that `fuse-overlayfs` is installed and available in your path. Version `0.7.6` or newer is
required. It might also be required to adjust the `storage.conf` to change the `driver` option under
`[storage]` to `"overlay"` and point the `mount_program` option in `[storage.options.overlay]` to the path
of the `fuse-overlayfs` executable.

The `storage.conf` can be set at:

```bash
# for system -- best practice
/etc/containers/storage.conf

# for users
~/.config/containers/storage.conf
```

### Usage

`podman` usage is mostly identical to `docker`. All commands running on `docker` are supported by
`podman`.

## Buildah

### Usage

Use `pull` to get an image. Then run `from` to start a container build. Most `Dockerfile` prefixes
can then be used as commands:

```bash
container=$(buildah from docker.io/ubuntu:xenial)                 # build base image
buildah run $container -- mkdir /home/jakob                       # runs command inside container
buildah copy $container ~/.bashrc /home/jakob/.bashrc             # copies files to container
buildah config --cmd "/bin/bash" $container                       # sets the command for the container
buildah config --entrypoint "cmd" $container                      # sets entrypoint
buildah config --entrypoint '["cmd", "arg1", "arg2"]' $container  # sets entrypoint
buildah config --env key=val $container                           # sets environment value
buildah bud -t tag:latest .                                       # build using dockerfile
buildah bud --layers -t tag:latest .                              # build using dockerfile and cache
                                                                  # intermediate layers
```

## Images

The `docker.io/archlinux` image can be extremely useful to run software quickly to try it out
without allowing it to impact the host system.

Alpine Linux is another popular choice due to small image size. However, due to different `glibc`
implementations, there are a few things that one has to be aware when running those images.

The `docker.io/debian:stable-slim` image provides nice a Debian image for testing.

The `docker.io/ubuntu:bionic` image provides nice an Ubuntu image for testing.

For a custom base image that contains this setup, run:

```sh
# in project root
buildah bud --layers -t base:latest -f base.dockerfile .
# launch it, and attach to it
podman run --rm --name base -itd base:latest /usr/bin/zsh
podman attach base
```

## Best Practices

It is best practices to use `buildah` as the build tool to build all docker images. `podman` can
then be used to manage the images, run containers, orchestrate different setups, etc.

## Tooling

Additional tooling for containers and images in general.

### Hadolint

Haskell Docker Linter is a static linter for Dockerfile best practices. It can be installed from
AUR or from `asdf`.

### Dive

Install the `dive` package using `yay` or `asdf`.

To inspect an image build with `podman` or `buildah`, use the `--source podman` flag.

### Grype

Install `grype` via `pacman`. It provides security vulnerability inspections for your docker images.

### Trivy

Install `trivy` via `pacman` (must have blackarch repo enabled). It provides security vulnerability inspections for your docker images,
Kubernetes resources, Dockerfiles, and more.

## Troubleshooting

If you get an error similar to the following on an image pull:

```
Error processing tar file(exit status 1): there might not be enough IDs available in the
namespace (requested 0:42 for /etc/gshadow): lchown /etc/gshadow: invalid argument
```

Then simply recreate the subuid/subgid files and run the following:

```bash
rm /run/user/$(id -u)/libpod/pause.pid
```

Or instead call `podman system migrate` which is safer than deleting the PID file.
