#!/bin/sh
echo "--> Fixing timezone..."
cp /usr/share/zoneinfo/$TIMEZONE /etc/localtime
echo $TIMEZONE > /etc/timezone
date
echo "--> Creating crontab..."
echo -e "$CRON_SCHEDULE ash /run-backup.sh\n" > /etc/crontabs/root
echo "--> Starting cron daemon..."
crond -f
