#!/bin/bash

SOURCE=$1
timestamp=$(date '+%Y-%m-%d %H:%M:%S')
DEST=$2

zip -r "$DEST/backup_$timestamp.zip" "$SOURCE"
echo "sucessfully done"
