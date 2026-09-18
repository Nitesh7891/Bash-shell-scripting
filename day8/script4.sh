#!/usr/bin/bash

<<Comment
Sync two directories.
Comment


read -p " Enter first dir : " First_Dir
read -p " Enter second dir : " Second_Dir

rsync -av --delete "First_Dir" "Second_Dir"




