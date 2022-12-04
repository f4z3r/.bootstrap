# Pacman

## Troubleshooting

### GPG Database Corruption

In case you receive errors such as:

```
error: GPGME error: No data
```

You can reset your GPG keys and refresh your database:

```bash
sudo rm -rf /etc/pacman.d/gnupg /var/lib/pacman/sync /var/lib/pacman/sync/blackarch.db.sig
sudo pacman -Scc
sudo pacman-key --init
sudo pacman-key --populate archlinux blackarch
sudo pacman -Fyy
sudo -E pacman -Syu
sudo pacman -Syyu
```

