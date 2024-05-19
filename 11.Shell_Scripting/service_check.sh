#!/bin/bash

SERVICE="apache2"
LOGFILE="/var/log/service_check.log"

if ! systemctl is-active --quiet $SERVICE; then
    systemctl start $SERVICE
    echo "$(date): $SERVICE was down, restarted." >> $LOGFILE
    echo "$SERVICE was down, restarted." | mail -s "$SERVICE Status Alert" admin@example.com
else
    echo "$(date): $SERVICE is running normally." >> $LOGFILE
fi

Explanation:

 Purpose: Checks if a specified service is running, restarts it if it's not, and logs the event.
 
Key Commands:
  - systemctl is-active --quiet $SERVICE: Checks if the service is active.
  - systemctl start $SERVICE: Restarts the service if it's not active.
  - echo ... >> $LOGFILE: Logs the service status.
  - mail -s: Sends an email alert if the service was restarted.