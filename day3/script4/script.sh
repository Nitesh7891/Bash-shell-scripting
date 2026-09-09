#!/bin/bash

<<Comment
User input calculator – Take two numbers and an operator from user input, perform the calculation
Comment

read -p "Enter first number :" first
read -p "Enter second number :" second
read -p "Enter which operation you want to perform (-,+,*,/) :" operator


case "$operator" in 
	+)
		echo " $(($first + $second)) "
		exit 0
		;;
	-)
		echo " $(($first - $second)) "
		exit 0
		;;
	\*)
		echo " $(($first * $second)) "
		exit 0
		;;
	/)
		if [ $second -eq 0 ]]; then 
		   echo "undefined !"
		   exit 1
		else 
			echo " $(($first / $second)) "
			exit 0
		fi
		;;
	*) 
		echo "Invalid operand !"
		exit 1
                ;;	
esac
	         
