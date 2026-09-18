#!/bin/bash 

<<Comment
Countdown timer that prints remaining seconds.
Comment


Seconds=50

while [ "$Seconds" -gt 0 ]
do
    echo "Remaining: $Seconds seconds"

    sleep 1

    Seconds=$((Seconds - 1))
done

echo "Time's up!"
