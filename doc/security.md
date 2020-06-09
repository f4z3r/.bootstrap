# Security

<!-- vim-markdown-toc GFM -->

* [Lock root account](#lock-root-account)
* [Sudo restrictions](#sudo-restrictions)
* [Editing in root context](#editing-in-root-context)
* [Shell timeouts](#shell-timeouts)
* [SELinux](#selinux)

<!-- vim-markdown-toc -->

## Lock root account

In order to lock the root account, use

```sh
sudo passwd -l root
```

This disables password login, but does not prevent SSH key based logins.

SSH root login can be prevented by adding:

```
PermitRootLogin no
```

in `/etc/ssh/sshd_config`.

## Sudo restrictions

Sudoers should be restricted to the tasks they require.

Add `Defaults insults` to `/etc/sudoers` to provide "insults" to failed password attempts.

## Editing in root context

Set the `SUDO_EDITOR` variable to edit files with root privileges, without needing to run the editor
in root context. A write protected file can then be edited with `sudo -e`.

## Shell timeouts

Set `TMOUT` to let shells timeout after some time in seconds. Note setting this in system profiles
can lead to issues where X times out. For system wide `bash`/`zsh` timeouts use:

```sh
TMOUT="$(( 10*60 ))";
[ -z "$DISPLAY" ] && export TMOUT;
case $( /usr/bin/tty ) in
  /dev/tty[0-9]*) export TMOUT;
esac
```

in `/etc/profile.d/shell-timeout.sh`. This will no time out X shells etc. Another possible way is to
set the value in `/etc/environment`. This is handled by PAM and allows any launched shell on the
system to get the environment variable. This file only accepts basic `key=value` pairs.

## SELinux

> TODO(@jakob): read up and try to implement RBAC on machine
