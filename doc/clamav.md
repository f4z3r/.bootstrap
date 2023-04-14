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

Use `freshclam` (as root) to update the database of virus definitions. The database files are stored
under `/var/lib/clamav/`. Enable the `clamav-freshclam.service` to keep the definitions up to date.

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


## On Access Scan

This can make sense to activate on directories such as the `Downloads` directory in order to ensure
that no malicious file is accessed. This can be done as follows:

- Open `/etc/clamav/clamd.conf`.
- Add the `/home/jakob/Downloads` path under `OnAccessIncludePath`.
- Add the `/home/jakob/Documents` path under `OnAccessIncludePath`.
- Add the `/home/jakob/Videos` path under `OnAccessIncludePath`.
- Add the `/home/jakob/Public` path under `OnAccessIncludePath`.
- Add the `/home/jakob/Music` path under `OnAccessIncludePath`.
- Add the `/home/jakob/Desktop` path under `OnAccessIncludePath`.
- Set `OnAccessPrevention` to `yes`.
- Set `OnAccessExcludeUname` to `clamav`.
- Add the `clamav` user to the `jakob` group to allow it to read files
  (`sudo usermod -aG jakob clamav`)
- Reboot, start and enable the `clamav-clamonacc.service` via SystemD.

## Cron Jobs

Create a scanning script file:

```bash
#!/bin/bash
LOG_DIR=/home/jakob/.local/log/clamav
LOG=${LOG_DIR}/clamav.log
TMP_LOG=/tmp/clam.monthly

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

Save the file in `/etc/cron.monthly/` and make it executable:

```sh
sudo chmod +x /etc/cron.weekly/my-clamscan
```

And add the following to `/etc/logrotate.d/clamav`:

```
/home/jakob/.local/log/clamav/clamav.log {
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
