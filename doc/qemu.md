# QEMU

## Installation

```sh
sudo pacman -S qemu
```

## General Setup

Create a directory to hold all VMs.

```sh
$ mkdir ~/vms/
$ mkdir ~/vms/share
```

### Windows Setup

### Ubuntu

#### Setup

Download the ISO of choice from Ubuntu's download page.

Make directory to hold Ubuntu VM.

```sh
$ mkdir -p ~/vms/ubuntu-18.04
```

Create a script `ubuntu-18.04.sh`, and update the `iso` parameter to contain the name of the ISO
file. Moreover, change the `-m` flags for more memory, and change the installer command for more
storage. See the help pages for more customizability.

```sh
#!/usr/bin/env bash

# Creates an image using 8G memory, 120G storage, and 2 CPUs.

set -eux

# Parameters.
id=ubuntu-18.04.4-desktop-amd64
disk_img="${id}.img.qcow2"
disk_img_snapshot="${id}.snapshot.qcow2"
iso="${id}.iso"

# Go through installer manually.
if [ ! -f "$disk_img" ]; then
  qemu-img create -f qcow2 "$disk_img" 120G
  qemu-system-x86_64 \
    -cdrom "$iso" \
    -drive "file=${disk_img},format=qcow2" \
    -enable-kvm \
    -m 8G \
    -smp 2 \
  ;
fi

# Snapshot the installation.
if [ ! -f "$disk_img_snapshot" ]; then
  qemu-img \
    create \
    -b "$disk_img" \
    -f qcow2 \
    "$disk_img_snapshot" \
  ;
fi

# Run the installed image.
qemu-system-x86_64 \
  -drive "file=${disk_img_snapshot},format=qcow2" \
  -enable-kvm \
  -m 8G \
  -smp 2 \
  -soundhw hda \
  -vga virtio \
  -virtfs local,id=vmshare,path=/home/jakob/vms/share/,security_model=mapped,mount_tag=vmshare \
  "$@" \
;
```

#### Run

Run the `ubuntu-18.04.sh` script and install Ubuntu. The second time the script is run, it will
normally boot into Ubuntu.

## Shared Folders

In the script from Ubuntu, `-virtfs` defines the shared virtual filesystem. In order to mount it in
the guest OS, use the following command.

```sh
$ mkdir ~/share
$ sudo mount -t 9p -o trans=virtio,version=9p2000.L vmshare /home/jakob/share
```
