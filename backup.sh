#!/bin/bash

# ==============================
# CONFIGURATION
# ==============================

SOURCE_DIR="/var/www/myapp"
BACKUP_DIR="/var/backups/myapp"
RETENTION_DAYS=7
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/myapp_backup_$DATE.tar.gz"
LOG_FILE="$BACKUP_DIR/backup.log"

# ==============================
# CREATE BACKUP DIRECTORY IF NOT EXISTS
# ==============================

mkdir -p $BACKUP_DIR

# ==============================
# CREATE COMPRESSED BACKUP
# ==============================

echo "[$(date)] Starting backup..." >> $LOG_FILE

tar -czf $BACKUP_FILE $SOURCE_DIR

if [ $? -eq 0 ]; then
    echo "[$(date)] Backup successful: $BACKUP_FILE" >> $LOG_FILE
else
    echo "[$(date)] Backup failed!" >> $LOG_FILE
    exit 1
fi

# ==============================
# DELETE OLD BACKUPS
# ==============================

find $BACKUP_DIR -name "*.tar.gz" -type f -mtime +$RETENTION_DAYS -exec rm -f {} \;

echo "[$(date)] Old backups cleaned." >> $LOG_FILE

echo "Backup process completed successfully."
