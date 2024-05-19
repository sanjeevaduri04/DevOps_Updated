#!/bin/bash

LOGFILE="/var/log/auth.log"
THRESHOLD=10

awk '/Failed password/ {print $(NF-3)}' $LOGFILE | sort | uniq -c | sort -nr | while read count ip; do
    if [ $count -gt $THRESHOLD ]; then
        echo "IP $ip has $count failed login attempts" | mail -s "Failed Login Alert" admin@example.com
    fi
done


Explanation:

Purpose: Monitors authentication logs for failed login attempts and sends an alert if the number of
         attempts from a single IP exceeds a threshold.
Key Commands:
 - awk '/Failed password/ {print $(NF-3)}' $LOGFILE: Extracts IP addresses with failed login attempts.
 - sort | uniq -c | sort -nr: Sorts and counts the occurrences of each IP.
 - while read count ip; do ... done: Checks if the count exceeds the threshold and sends an alert.
 
 These shell scripts provide practical solutions for automating and managing various tasks in real-time 
    environments, improving efficiency and responsiveness to critical events.