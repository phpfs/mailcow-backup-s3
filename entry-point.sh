#!/bin/sh
echo "Creating crontab..."
echo -e "$CRON_SCHEDULE ash /run-backup.sh\n" > /etc/crontabs/root
echo "Starting cron daemon..."
crond -f
