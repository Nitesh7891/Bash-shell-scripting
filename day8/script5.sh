#!/usr/bin/bash

<<Comment
Database backup script with rotation.
Comment

DB_URI="mongodb://localhost:27017/my_database"
BACKUP_DIR="/mnt/d/practice/practice-scripts/backup"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
FILENAME="db_backup_$TIMESTAMP.archive"

mongodump --uri="$DB_URI" --archive="$BACKUP_DIR/$FILENAME" --gzip

ls -t "$BACKUP_DIR"/db_backup_*.archive | tail -n +6 | xargs -r rm -f

echo "Database backup $FILENAME created and older backups pruned."
