#!/bin/bash

SOURCE_DIR="/path/to/source"
BACKUP_DIR="/path/to/backup"
DATE=$(date +%Y%m%d-%H%M%S)
BACKUP_NAME="backup-$DATE.tar.gz"

tar -czf $BACKUP_DIR/$BACKUP_NAME $SOURCE_DIR
find $BACKUP_DIR -type f -mtime +7 -exec rm {} \;

echo "Backup completed: $BACKUP_NAME"


Explanation:

Purpose: Creates a compressed backup of a specified directory and removes backups older than 7 days.
Key Commands:
 - tar -czf $BACKUP_DIR/$BACKUP_NAME $SOURCE_DIR: Creates a compressed backup.
 - find $BACKUP_DIR -type f -mtime +7 -exec rm {} \;: Deletes backup files older than 7 days.
 - echo "Backup completed: $BACKUP_NAME": Logs the completion of the backup.