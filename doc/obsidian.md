# Obsidian

## Installation

Install via the `obsidian` package.

## Configuration

Set the vault to be in `~/data/obsidian/` and ensure the following:

- That you set strict newlines.
- That you create new files in the current directory.

## Syncing

You can sync the vault with Google drive via `rclone`.

In order to then pull data you can use:

```sh
# copy remote to local
rclone sync iptdrive:/ /home/jakob/data/obsidian/
# copy local to remote
rclone sync  /home/jakob/data/obsidian/ iptdrive:/
```
