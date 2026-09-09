#!/bin/bash

<<comment
Create a web server monitoring script that checks the service status, restarts it if stopped, and logs the status with a timestamp.
comment


service=$1;
path="./server.log"
if systemctl is-active --quiet "$service"
 then 
	 echo "$(date '+%Y-%m-%d %H:%M:%S') $service is running" >> "$path" 
 else
	 echo "$(date '+%Y-%m-%d %H:%M:%S') $service stopped running" >> "$path"

	 systemctl restart "$service"
	  
	if systemctl is-active --quiet "$service"
	then 
		echo "$(date '+%Y-%m-%d %H:%M:%S') $service is running" >> "$path"
	else
	        echo "$(date '+%Y-%m-%d %H:%M:%S') $service stopped running" >> "$path"
	fi
fi
