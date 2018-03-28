#!/bin/bash

declare -i sum=0
declare -i tall

while read tall
do
	(( sum+= tall ))
done

echo "Summen er $sum."
