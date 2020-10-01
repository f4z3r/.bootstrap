# Clam AntiVirus

* [Installation](#installation)
* [Test Installation](#test-installation)
* [Add Virus DBs](#add-virus-dbs)
  * [FangFrisch](#fangfrisch)
* [Usage](#usage)
* [Cron Jobs](#cron-jobs)

## Installation

Install the `clamav` package from `pacman`.

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

## Add Virus DBs

### FangFrisch

Install the `python-fangfrisch` package from the AUR. Then create the database structure using:

```sh
sudo -u clamav /usr/bin/fangfrisch --conf /etc/fangfrisch/fangfrisch.conf initdb
```

And enable the `fangfrisch.timer`.

## Usage

```sh
clamscan myfile
clamscan --recursive --infected /home
sudo clamscan --recursive --infected --exclude-dir='^/sys|^/dev' /
```

Use `--remove` or `--move=/dir` to delete or quarantine infected files. Using `-l /path` will log
the results to the provided path.

## Cron Jobs

Create a scanning script file:

```bash
#!/bin/bash
LOG_DIR=/home/jakob/.local/log
LOG=${LOG_DIR}/clamav.log
TMP_LOG=/tmp/clam.weekly

av_report() {
	DATE=`date "+%F"`
	ALERT_FILENAME="/home/jakob/.clamav-log-${DATE}.XXXXX"

	if [ `cat ${TMP_LOG}  | grep Infected | grep -v 0 | wc -l` != 0 ]; then
		ALERT_FILE=`mktemp ${ALERT_FILENAME}.alert`
	else
		ALERT_FILE=`mktemp ${ALERT_FILENAME}`
	fi

	tail -n 50 ${TMP_LOG} > ${ALERT_FILE}

  [[ -d ${LOG_DIR} ]] || mkdir -p ${LOG_DIR};

	cat ${TMP_LOG} >> ${LOG}
	rm -rf ${TMP_LOG}
}

av_scan() {
	touch ${TMP_LOG}
	clamscan -r / --exclude-dir='^/sys|^/dev' --quiet --infected --log=${TMP_LOG}
}

av_scan
av_report
```

Save the file in `/etc/cron.weekly/` and make it executable:

```sh
sudo chmod +x /etc/cron.weekly/my-clamscan
```

And add the following to `/etc/logrotate.d/clamav`:

```
/home/jakob/.local/log/clamav.log {
    daily
    dateext
    dateformat -%d%m%Y
    missingok
    rotate 90
    compress
    delaycompress
    notifempty
    create 600 jakob jakob
}
```
