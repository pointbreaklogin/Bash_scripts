#!/bin/bash

#ip of system
host=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')
cuser=$(logname)

# Set the backup directory
backup_dir=/home/$cuser/backupdir_$host
# Set the date format for the backup files
date_format=$(date +"%d-%m-%Y")
# Set the name of the backup file
backup_file=home_$cuser-$date_format.tar.gz

# Create the backup directory if it doesn't exist
if [ ! -d $backup_dir ]; then
  mkdir $backup_dir
  echo "Directory created for backup"
fi

#Create the backup using tar command
tar -czvf $backup_dir/$backup_file /home/$cuser/*
echo "" 
echo "Backup created in $backup_dir"
