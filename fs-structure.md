# File System Structure

This is base structure we follow in order to keep our system properly structured.

## General Structure

Generally we follow the base linux structure. Therefore for any fined grained structure we place
binaries into `bin`, optional code and data into `opt`, shared runtime data into `share`, etc.

## Home Structure

- `.local/opt`: external software code for binaries running on the system.
- `.local/bin`: external software binaries running on the system.
- `.local/share`: runtime data for external software running on the system.
- `.local/log`: log data for external software running on the system.
- `opt`: for any development work we are doing.
- `data`: for information meant to be long lasting. This does not include documents. It should only
  contain raw data.
- `tmp`: for temporary information meant to be persistent across boots.
- `tmp/play`: directory meant to contain data used to play around with technologies.
- `vms`: directory containing guest VMs.
- `screenshots`: location for automatic screenshots.
- `Documents`: only for documents meant to be fully persistent. Such as contractual documents, etc.
- `Music`: all music data.
