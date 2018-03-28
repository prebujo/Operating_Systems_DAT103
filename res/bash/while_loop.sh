#!/bin/bash

declare -i tall=0

while [ $tall -lt 10 ]
do
	echo "Tallet er $(( tall++ ))."
done

while ((tall>0))
do
	echo "Tallet er $(( tall-- ))."
done
