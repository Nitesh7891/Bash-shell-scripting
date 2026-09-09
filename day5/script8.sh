#!/bin/bash

<<Comment
Find lines containing two different patterns.
Comment

tr ':[upper]:' ':[lower]:' | awk '/error/ && / "database"/ {print}'
