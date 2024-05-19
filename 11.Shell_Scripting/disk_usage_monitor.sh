#!/bin/bash

THRESHOLD=80
LOGFILE="/var/log/disk_usage.log"

while true; do
    USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
    if [ $USAGE -gt $THRESHOLD ]; then
        echo "$(date): Disk usage is at ${USAGE}%." >> $LOGFILE
        echo "Disk usage is above $THRESHOLD%. Usage: $USAGE%" | mail -s "Disk Space Alert" admin@example.com
    fi
    sleep 60
done

Explanation:

Purpose: Monitors disk usage and sends an alert if it exceeds a specified threshold.
Key Commands:
df /: Checks disk space usage of the root filesystem.
awk '{ print $5 }' | sed 's/%//g': Extracts the usage percentage.
mail -s: Sends an email alert if the usage is above the threshold.
sleep 60: Waits for 60 seconds before checking again.