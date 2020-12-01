# Bash

First, ensure `coc` is properly set up.

## Coc Extension

Install the `coc` extension.

```viml
CocInstall coc-sh
```

## Bash Debugging

Use the following options to enable better debugging:

```bash
set -x    # print line before executed (xtrace)
set -v    # print line after it was evaluated (replaces vars with values, etc)
set -f    # turn off file globbing
echo $-   # print options currently set
trap 'echo $var' EXIT   # print $var on exit of script (early failure debugging)
trap 'echo $var' DEBUG  # print $var after _every_ statement (brute forcing)


### Run through script line by line (enter to continue, CTRL-C to quit)
set -vx
trap read DEBUG

### Run through script line by line (will need to be killed to stop)
echo "Press CTRL+C to proceed."
trap "pkill -f 'sleep 1h'" INT
trap "set +x ; sleep 1h ; set -x" DEBUG
```
