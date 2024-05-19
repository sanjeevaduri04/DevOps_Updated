#!/bin/bash

SOURCE_DIR="/path/to/source"
DEST_DIR="/path/to/destination"
LOGFILE="/var/log/sync_files.log"

rsync -av --delete $SOURCE_DIR $DEST_DIR
if [ $? -eq 0 ]; then
    echo "$(date): Sync completed successfully." >> $LOGFILE
else
    echo "$(date): Sync failed." >> $LOGFILE
    echo "File synchronization failed." | mail -s "Sync Failure Alert" admin@example.com
fi


Explanation:

Purpose: Synchronizes files between source and destination directories, logs the result, and sends an
          alert if the sync fails.
 Key Commands:
  - rsync -av --delete $SOURCE_DIR $DEST_DIR: Performs the file synchronization.
  - echo ... >> $LOGFILE: Logs the result of the synchronization.
  - mail -s: Sends an email alert if the synchronization fails.