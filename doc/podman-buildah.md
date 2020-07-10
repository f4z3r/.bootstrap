# Podman and Buildah

These two tools provide very extensive and interesting replacements to `docker`.

They provide benefits such as:

- daemonless running containers
- rootless containers
- more fine grained control over builds and image commits

<!-- vim-markdown-toc GFM -->

* [Podman](#podman)
  - [Rootless](#rootless)
  - [Crun](#crun)
  - [Usage](#usage)
* [Buildah](#buildah)
  - [Usage](#usage-1)
* [Images](#images)
* [Best Practices](#best-practices)

<!-- vim-markdown-toc -->

## Podman

### Rootless

In order to run rootless containers, aka containers that only have the privileges from the user
running them, subordinate UIDs and GIDs can be used. Write the following in both `/etc/subuid` and
`/etc/subgid`, and modify the files to be readable by all (`sudo chmod 644 /etc/subuid`):

```
jakob:165536:65536
```

This will set subordinate UIDs and GIDs for user `jakob` in `/etc/subuid` and `/etc/subgid`.

### Crun

The default OCI runtime for podman is runC. However, runC does not support cgroup V2, which allows
non-privileged users to allocate memory and CPU resource limits.

In order to use it as the OCI runtime, install `crun`, and configure it under `runtime` in
`~/.config/containers/libpod.conf`.

```
runtime = "crun"
```

### Usage

`podman` usage is mostly identical to `docker`. All commands running on `docker` are supported by
`podman`.

## Buildah

### Usage

Use `pull` to get an image. Then run `from` to start a container build. Most `Dockerfile` prefixes
can then be used as commands:

```sh
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

## Best Practices

It is best practices to use `buildah` as the build tool to build all docker images. `podman` can
then be used to manage the images, run containers, orchestrate different setups, etc.

