# Time Warrior

## Installation

Install the `timew` package using `pacman`.

## Configuration

Link the configuration.

```sh
ln -s ~/.bootstrap/conf/timewarrior.cfg ~/.timewarrior/timewarrior.cfg
```

## Synchronization

Initialize a git repository in `~/.timewarrior/data/` and use it to synchronize all data. The
current pre-populated repository is `git@github.com:jakobbeckmann/timewarrior-data.git`.

## Conventions

Tracking should be done via `task` directly, and nearly never manually. This is because `task` also
internally tracks the time spent on specific tasks, not just projects and tags.

The naming conventions for time tracking are:

- `project`: taken over 1-to-1 from `task`
- `tags`: `t-` prefix added from `task`.
- everything else: should not be tracked by `timew`.
