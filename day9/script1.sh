#!/bin/bash

<<Comment
Print date in 5 different formats (ISO, epoch, human-readable, etc).
Comment


echo "ISO: $(date '+%Y-%m-%dT%H:%M:%S%z')"
echo "epoch:$(date +%s)"
echo "human readable: $(date '+%A, %d %B %Y %I:%M:%S %p')"
echo "Date & Time: $(date '+%d/%m/%Y %H:%M:%S')"
