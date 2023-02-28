#!/bin/bash

#ip of system
host=$(hostname -I)
cuser=$(logname)

# Set the backup directory
backup_dir=/home/$cuser/backupdir_$host
# Set the date format for the backup files
date_format=$(date +"%d-%m-%Y")
# Set the name of the backup file
backup_file=home_$cuser$date_format.tar.gz

# Create the backup directory if it doesn't exist
if [ ! -d $backup_dir ]; then
  mkdir $backup_dir
fi

#Create the backup
tar -czvf /home/$cuser/$backup_dir/$backup_file /home/$cuser/*
