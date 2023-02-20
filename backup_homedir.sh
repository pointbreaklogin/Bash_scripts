#!/bin/bash

# Set the backup directory
backup_dir=/backups


# Set the date format for the backup files
date_format=$(date +"%d-%m-%Y")

# Set the name of the backup file
backup_file=$user_home_$date_format.tar.gz

# Create the backup directory if it doesn't exist
if [ ! -d $backup_dir ]; then
  mkdir $backup_dir
fi

# Create the backup
tar -czvf $backup_dir/$backup_file ~/

#uploading to remote server (ssh key-based login enabled)
rsync pointbreak@172.16.50.50:/backup /backup