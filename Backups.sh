#!/bin/bash

               # Define variables (modify as needed)

SOURCE_DIR=$1

DEST_DIR=$2

BACKUP_FILE="backup_$(date +%Y-%m-%d).zip"  # Backup filename with date

                # Check if backup directory exists, create it if not
function backup_dir {
        if [ ! -d "$DEST_DIR" ]; then # This checks if the directory specified by the variable $BACKUP_DIR does not exists.
                mkdir -p "$DEST_DIR"
                echo "Backup directory created: $DEST_DIR"
        fi

                # Perform backup using zip with compression

        zip -r "$DEST_DIR/$BACKUP_FILE" "$SOURCE_DIR" >&/dev/null
                # Check for successful backup completion

        if [ $? -eq 0 ]; then
                echo "Backup completed successfully: $BACKUP_FILE"
        else
                echo "Backup failed!"
        fi
}

backup_dir
