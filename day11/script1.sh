#!/bin/bash

#Read a CSV of employees and compute average/max salary per department.


file="employees.csv"


awk -F',' '
NR > 1 {
	dept = $2
	salary = $3

	sum[dept]+=salary
	count[dept]++

	if (!(dept in max) || salary > max[dept]) {
		       	max[dept] = salary 
		}
              }
                END { 
	         printf "%-15s %-15s %-15s\n", "Department", "Average Salary", "Max Salary" 
		 for (dept in sum) { 
			 printf "%-15s %-15.2f %-15.2f\n", dept, sum[dept] / count[dept], max[dept] 
		 }
               } 
		' "$file"


