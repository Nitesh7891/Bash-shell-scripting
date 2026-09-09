#!/bin/bash

<<Comment
This is for deleting the files which has larger size than 20k in a given directory
Comment

read -p "Enter the directory file where you want to delete files which are larger than 20kb:" path


find "$path" -type f -size +20k -printf "%f\n" -delete
   
