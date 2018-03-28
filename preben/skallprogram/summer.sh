#!/bin/bash

echo "Hvilke tall ønsker du å summere? (enter mellom hvert tall og ctrl+d avslutter)"

declare -i SUM=0

while read num
do      
     SUM+=$num
done

echo "Summen er $SUM"
