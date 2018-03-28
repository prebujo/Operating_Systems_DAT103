#!/bin/bash
echo "Hvilken hendelse?"

read NAME
declare FILE=$1

declare -i SUM=0

while read -r INCI AMOUNT ; do
	echo "$INCI"
	echo "$AMOUNT"
	SUM+=$AMOUNT
done <<< $(grep $NAME $FILE)
	
echo "SUM: $SUM"

