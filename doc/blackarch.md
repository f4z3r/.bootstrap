# BlackArch

[BlackArch][black-arch-main] is the pen-testing distribution built on Arch Linux. Its repositories
can be added to any Arch distro to provide the tools it contains.

## Installation

Get the bootstrap script:

```bash
curl -O https://blackarch.org/strap.sh
# verify sha1sum: 9f770789df3b7803105e5fbc19212889674cd503
# check shasum on https://www.blackarch.org/downloads.html#install-repo
echo 95b485d400f5f289f7613fe576f4a3996aabed62 strap.sh | sha1sum -c
# run the script
chmod +x strap.sh
sudo ./strap.sh
sudo pacman -Syu
```

## Bundles

You can list available bundles with:

```bash
sudo pacman -Sg | grep blackarch
```

## Useful Tools

### Bind

Provides tools such as `dig` for DNS discovery.

### Metasploit

### Nmap / Ncat

```bash
# scan address/network for open ports
nmap -sT <ip/net>
# listen on port 8080 for communications
ncat -l 8080
# check if host is available
ncat -zv 192.168.56.10 20-80
# perform GET HTTP request
echo "GET / HTTP/1.1" | ncat -v <ip> <port>
```


[black-arch-main]: https://www.blackarch.org/
