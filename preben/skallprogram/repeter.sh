#!/bin/bash
if (( $# != 2 ))
then
   echo "Du har feil antall argumenter"
   exit 22
fi
   
for ((i=0; i<$1; i++))
do
  echo $2
done
