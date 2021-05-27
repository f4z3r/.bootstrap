# Docker

See [`./podman-buildah.md`](./podman-buildah.md) for alternatives to `docker`.

* [Installation](#installation)
* [Images](#images)
  * [Dangling Images](#dangling-images)
* [Volume Management](#volume-management)
  * [Data Sharing](#data-sharing)
  * [Persistency](#persistency)
* [Containers](#containers)
  * [Commit to Image](#commit-to-image)
* [Image Transfer](#image-transfer)
* [Docker-compose](#docker-compose)
* [Tools](#tools)

## Installation

Install the `docker` package using `pacman`.

Then add your user to the docker group to run without requiring root privileges every time. First
ensure a `docker` group exists.

```sh
cat /etc/group | grep docker
```

Then add the current user to the group.

```sh
sudo gpasswd -a $(whoami) docker
```

Reboot and then run the following to ensure everything is fine.

```sh
docker run --rm -it archlinux bash -c "echo hello jakob"
```

## Images

The `archlinux` image can be extremely useful to run software quickly to try it out without allowing
it to impact the host system.

Alpine Linux is another popular choice due to small image size. However, due to different `glibc`
implementations, there are a few things that one has to be aware when running those images.

The `debian:stable-slim` image provides nice a Debian image for testing.

The `ubuntu:bionic` image provides nice an Ubuntu image for testing.

### Dangling Images

Remove dangling images using:

```sh
docker rmi $(docker images -f "dangling=true" -q)
```

Or with `<none>` names:

```sh
docker rmi $(docker images | grep "<none>")
```

## Volume Management

### Data Sharing

To share a folder between a docker container and the host use the `-v` flag.

```sh
docker run --name prusti-dev -v /home/jakob/prog:path/container -it ubuntu:bionic bash
```

### Persistency

Use `docker volume create <name>` to create a volume. A container can then be started with the
`--mount` flag to attach the volume.

```sh
docker run --name prusti-dev --mount source=myvol,target=path/container -it ubuntu:bionic bash
```

## Containers

To start a stopped or exited container, use the `start` command. You can then attach to the
container using `attach`. The default detach key sequence is `ctrl-p ctrl-q`.

### Commit to Image

It is possible to save the state of a container to an image, allowing to run it from said state over
and over.

```sh
docker commit <container-name/id> <image-name>
```

## Image Transfer

Use

```sh
docker save -o back.tar <imgname>
```

to save an image to a tar file. This file can then be transfered across a network. Use

```sh
docker load -i back.tar
```

to load the image on the receiver.

## Docker-compose

Install `docker-compose` via `pipx`.

## Tools

See [`./podman-buildah.md`](./podman-buildah.md) for tooling.
