# Clam AntiVirus

## Installation

Install the `clamav` package from `pacman`.

## Usage

> Note: most of the following commands need to be run as root.

Use `freshclam` to update the database of virus definitions. The database files are stored under
`/var/lib/clamav/`. Enable the `clamav-freshclam.service` to keep the definitions up to date.

Start and enable the `clamav-daemon.service` to check for viruses. This should only be done after
having run `freshclam` at least once.

## Test Installation

Run

```sh
curl https://secure.eicar.org/eicar.com.txt | sudo clamscan -
```

And check that the output includes `stdin: Win.Test.EICAR_HDB-1 FOUND`.
