# rsync

`rsync` is a very advanced copying tool used to copy large amounts of data across networks or within
the same machine.

## Installation

Simply install the `rsync` package.

> Note that in order to use `rsync` to copy files remotely, it needs to be installed on both the
> remote and the host.

## Examples

```sh
rsync -azv remote:src/bar/ /home/owner/bar
```

Synchronizes in _archive_ mode all files contained _in_ `src/bar/` (due to trailing slash) with
local directory. Archive mode preserves permissions, synchronises modification times, transfers
links, etc. Moreover the files are compressed during transfer to save bandwidth.

The same can be used fully locally to synchronise folders, in that case the `-z` flag is pointless,
as no transfer is performed.

Moreover, use `--exclude` to provide gitignore style excludes. Finally, use `-n` for dry runs and
`--ignore-existing` to ignore existing files on the target and not replace them in case changes were
made or modification dates differ.
