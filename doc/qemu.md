# QEMU

<!-- vim-markdown-toc GFM -->

* [Installation](#installation)
* [General Setup](#general-setup)
  - [Windows](#windows)
    + [Setup](#setup)
    + [Shared Folders](#shared-folders)
  - [Ubuntu](#ubuntu)
    + [Setup](#setup-1)
    + [Shared Folders](#shared-folders-1)
* [Run](#run)
  - [Return Focus](#return-focus)

<!-- vim-markdown-toc -->

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

> Each time a pristine installation is required, delete the snapshot and relaunch the scripts.

### Windows

#### Setup

Download the ISO of choice from Windows' download page. Also download Virtio network drivers for
Window from [Fedora's page][0].

Make directory to hold Windows VM.

```sh
$ mkdir -p ~/vms/windows-10
```

Create a script `windows-10.sh`, and update the `iso` parameter to contain the name of the ISO file.
Also modify `virtio_iso` to point to network driver image. Moreover, change the `-m` flags for more
memory, and change the installer command for more storage. See the help pages for more
customizability.

```sh
#!/usr/bin/env bash

# Creates an image using 8G memory, 120G storage, and 2 CPUs.

set -eux

# Parameters.
id=Win10_1909_EnglishInternational_x64
virtio_iso="virtio-win-0.1.171.iso"
disk_img="${id}.img.qcow2"
disk_img_snapshot="${id}.snapshot.qcow2"
iso="${id}.iso"

# Go through installer manually.
if [ ! -f "$disk_img" ]; then
  qemu-img create -f qcow2 "$disk_img" 120G
  qemu-system-x86_64 \
    -cdrom "$iso" \
    -drive "file=${disk_img},format=qcow2" \
    -drive "file=${virtio_iso},index=3,media=cdrom" \
    -enable-kvm \
    -m 8G \
    -smp 2 \
    -cpu host \
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
  -cpu host \
  -soundhw hda \
  -vga virtio \
  -virtfs local,id=mvshare,path=/home/jakob/vms/share/,security_model=mapped,mount_tag=vmshare \
  -net nic -net user,smb=/home/jakob/vms/share/ \
  "$@" \
;
```

During the installation, the Windows installer will ask you for your Product key and perform some
additional checks. When it gets to the "Where do you want to install Windows?" screen, it will give
a warning that no disks are found. Follow the example instructions below:

1. Select the option Load Drivers.
2. Uncheck the box for "Hide drivers that aren't compatible with this computer's hardware".
3. Click the Browse button and open the CDROM for the virtio iso, usually named "virtio-win-XX".
4. Now browse to E:\viostor\[your-os]\amd64, select it, and press OK.
5. Click Next
6. Install a driver.
7. Repeat until all drivers are installed.

You should now see your `virtio` disks listed here, ready to be selected, formatted and installed
to.

Once the install is complete, make to install all updates before rebooting.

After install reboot twice before making any installation, to ensure changes are made to snapshot
image and not to installation image.

#### Shared Folders

In the script from Windows, `-virtfs` defines the shared virtual filesystem. It will automatically
be mounted by the `smb` argument. The shared folder will be available under `\\10.0.2.4\qemu`. Enter
the address in the file explorer and provide the host user credentials to gain access.

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

After install reboot twice before making any installation, to ensure changes are made to snapshot
image and not to installation image.

#### Shared Folders

In the script from Ubuntu, `-virtfs` defines the shared virtual filesystem. In order to mount it in
the guest OS, use the following command.

```sh
$ mkdir ~/share
$ sudo mount -t 9p -o trans=virtio,version=9p2000.L vmshare /home/jakob/share
```

## Run

Run the `ubuntu-18.04.sh` or `windows-10.sh` script and install Ubuntu/Windows. The second time the
script is run, it will normally boot into Ubuntu/Windows.

### Return Focus

In order to return focus to host, press `Ctrl` + `Alt` + `G`. Note that some guests OS do not fully
capture input methods. When in Ubuntu VM, simply press `Host` + `<num>` to switch to another
workspace in the host OS, which needing to escape focus.

[0]: https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso
