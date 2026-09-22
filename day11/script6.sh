#!/bin/bash


#Calculate statistics (min, max, mean, median) from a column of numbers.


Input_file="numbers.txt"

sort -n "$Input_file" > sorted_numbers.txt

awk ' 
{
	numbers[NR] = $1
	sum += $1
}
END{
count = NR
min = numbers[1]
max = numbers[count]
mean = sum/count
if(count%2==1){
	median=numbers[(count+1)/2]
}else{
	median = (numbers[count/2]+numbers[count/2+1])/2
}  

printf "Count : %d\n",count
printf "Min    : %.2f\n", min
printf "Max    : %.2f\n", max
printf "Mean   : %.2f\n", mean
printf "Median : %.2f\n", median
}
' sorted_numbers.txt

rm sorted_numbers.txt


