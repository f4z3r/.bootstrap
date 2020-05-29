# Journaling

Use this to get information about service logs.

## Usage

```sh
journalctl -u sshd      # get logs about sshd unit
journalctl -t audit     # get logs about audit identifier
journalctl -g UFW       # grep through log with pattern UFW
journalctl -g UFW -e    # jump directly to pager end
journalctl -f           # follow logs
journalctl --list-boots # list boots
journalctl -b -1        # show logs from previous boot
```
