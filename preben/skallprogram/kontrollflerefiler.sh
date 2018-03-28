#!/bin/bash

for file in $@
do
    ( ./filkontroll2.sh $file 7 ) &
done
wait

   
