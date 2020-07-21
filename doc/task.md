# Task Warrior

## Installation

Install the `task` package using `pacman`. Moreover, install `taskw` using `pip`.

## Configuration

Link the configuration.

```sh
ln -s ~/.bootstrap/conf/taskwarrior ~/.config/taskwarrior
ln -s ~/.bootstrap/conf/.taskrc ~/.taskrc
ln -s ~/.bootstrap/conf/task/hooks/* ~/.task/hooks/
```

## Syncing with `inthe.AM`

The following will sync tasks over the `cirusthevirus130212@gmail.com` Google Account.

```sh
ln -s ~/.bootstrap/conf/task/keys ~/.task/keys
task sync init
```
