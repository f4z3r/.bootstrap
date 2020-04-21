# QEMU

## Installation

```sh
sudo pacman -S qemu
```

## Windows Setup

1. Create a directory somewhere to store the data for the virtual machine.
2. Create an image:
   ```sh
   qemu-img create -f qcow2 virtual.hd 8G
   ```
3. Boot from the disk drive:
   ```sh
   qemu -m 512 -cdrom /dev/cd0a -boot d -monitor stdio -no-acpi virtual.hd
   ```

