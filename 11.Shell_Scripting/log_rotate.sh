#!/bin/bash

LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/myapp/archive"

mkdir -p $ARCHIVE_DIR

find $LOG_DIR -type f -name "*.log" -mtime +7 -exec gzip {} \;
find $LOG_DIR -type f -name "*.log.gz" -mtime +30 -exec mv {} $ARCHIVE_DIR \;
find $ARCHIVE_DIR -type f -mtime +90 -exec rm {} \;

echo "Log rotation completed."

 Explanation:

Purpose: Compresses log files older than 7 days, moves compressed logs older than 30 days to an archive, 
         and deletes archived logs older than 90 days.
         
 Key Commands:
  
 - mkdir -p $ARCHIVE_DIR: Creates the archive directory if it doesn't exist.
 - find $LOG_DIR -type f -name "*.log" -mtime +7 -exec gzip {} \;: Compresses old log files.
 - find $LOG_DIR -type f -name "*.log.gz" -mtime +30 -exec mv {} $ARCHIVE_DIR \;: Moves old compressed logs to the archive.
 - find $ARCHIVE_DIR -type f -mtime +90 -exec rm {} \;: Deletes very old archived logs.