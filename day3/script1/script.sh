#!/bin/bash

<<Comment
System info script – Print hostname, OS version, kernel version, uptime, and logged-in users.
Comment

echo " Hostname: $(hostname) "
echo " OS Version: $(grep "^PRETTY_NAME=" /etc/os-release | cut -d '"' -f 2) "
echo " Kernel Version: $(uname -r) "
echo " uptime: $(uptime -p) "
echo " Logged-in users: $(who) "
