#!/bin/bash

LOGFILE="/var/log/resource_usage.log"

while true; do
    DATE=$(date '+%Y-%m-%d %H:%M:%S')
    CPU_USAGE=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    echo "$DATE CPU: $CPU_USAGE% MEM: $MEM_USAGE%" >> $LOGFILE
    sleep 5
done

Explanation:

Purpose: Logs CPU and memory usage to a file every five seconds.
Key Commands:
top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}': Retrieves CPU usage.
free | grep Mem | awk '{print $3/$2 * 100.0}': Retrieves memory usage.
echo ... >> $LOGFILE: Appends the usage data to a log file.
sleep 5: Waits for 5 seconds before the next check.
