#!/usr/bin

<<Comment
Backup a directory with a timestamped filename.
Comment

read -p "Directory for backup:" $source
backup = .

timeStamp = $(date +%Y%m%d_%H%M%S)

tar -czvf "$backup/backup_$TIMESTAMP.tar.gz" "$source"


