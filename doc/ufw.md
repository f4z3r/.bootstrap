# `ufw`

UFW is used to configure netfilters for the linux firewall.

## Installation

If not installed already, install the `ufw` (and `gufw`) packages from `pacman`.

## Configuration

The main configuration file is `/etc/default/ufw`. All other configuration is contained in
`/etc/ufw`.

Logging is performed to `/var/logs/ufw`.

> Note that as soon as a rule is matched, that rule is put into effect! Therefore one has to put
> specific rules first, and general ones last!!!
>
> ```sh
> $ sudo ufw status
> Firewall loaded
>
> To                         Action  From
> --                         ------  ----
> 22:tcp                     DENY    192.168.0.1
> 22:udp                     DENY    192.168.0.1
> 22:tcp                     DENY    192.168.0.7
> 22:udp                     DENY    192.168.0.7
> 22:tcp                     ALLOW   192.168.0.0/24
> 22:tcp                     DENY    192.168.0.6
> 22:udp                     DENY    192.168.0.6
> ```
>
> The above correctly denies ssh requests from `192.168.0.{1,7}` but incorrectly allows connections
> from `192.168.0.6` as the general rule is above and will match the request.


## Usage

```sh
sudo ufw enable          # enable on boot

sudo ufw status verbose  # get full status information
sudo ufw status numbered # get status information with rule numbers

sudo ufw allow ssh       # allow inc and out connections on port 22
sudo ufw allow 80/tcp    # allow only TCP connection on port 80
# allow from IP to any port, insert rule at index 1
sudo ufw insert 1 allow from 198.51.100.0

# allow connections from a subnet or specific IP
sudo ufw allow from 198.51.100.0/24
# allow connection from IP to port via TCP protocol; <any> is destination here
sudo ufw allow from 198.51.100.0 to any port 22 proto tcp

sudo ufw delete allow 80 # delete some rule
sudo ufw delete 1        # delete rule 1

sudo ufw logging on      # turn on logging
```

