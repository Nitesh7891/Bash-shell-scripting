#!/bin/bash

#Read a CSV of employees and compute average/max salary per department.


file = "./employees.scv"


awk -f',' '
NR > 1 {
	dept = $2
	salary = $3

	sum[dept]+=salary
	count[dept]++

	if[[ !(dept in max) || salary > max[dept] ]];then

'
