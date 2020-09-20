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

## Best Practices

Projects should be used for a _small_ collection of tasks. Thus projects named such as `work`,
`uni`, etc are undesired. The grouping of tasks into such larger categories should be performed via
_tags_. Better project names are for instance `thesis-report`, or `like-feature`, and each project
is then added to a larger collection of projects via tags such as `ipt`, `client-bit`, etc.

Tags can also be used to categorize tasks across projects such as `impl`, `research`, `org`, etc.
Finally, the description should be brief, as the task context is already provided by the project and
tags. Moreover, more details can be added by linking the task to a tracking issue.
