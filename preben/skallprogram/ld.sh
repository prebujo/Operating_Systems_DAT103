#!/bin/bash

declare FILES=$(find -type f -executable)
declare -i COUNT=0

for file in $FILES
do
	COUNT+=1
	echo "$file"
done

echo "$COUNT"
	

