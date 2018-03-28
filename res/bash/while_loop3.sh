#!/bin/bash

declare -i sum=0
exec 0<talliste.txt

while read tall
do
	(( sum+=tall ))
done

echo "Summen er $sum."
