#!/bin/bash

<<comment
Delete .log files older than 7 days and schedule the script to run daily at 10:30 AM IST using cron.
comment


read -p "Enter the path: " path

deleteOlderFiles(){
	find "$path" -type f -name "*.log" -mtime +7 | xargs rm 
}

deleteOlderFiles();
