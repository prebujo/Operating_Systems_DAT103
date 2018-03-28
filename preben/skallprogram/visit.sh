#!/bin/bash

echo "Hva er hendelsen?"

read INCIDENT
declare INCIFILE
declare -i SUM

while read line
do
  INCIFILE=$(cut -f 1 -d " " <<< $line)
  if [ $INCIFILE == $INCIDENT ]; then
  	SUM+=$(cut -f 2 -d " " <<< $line)
  fi
done < $1
echo "Sum: $SUM"
