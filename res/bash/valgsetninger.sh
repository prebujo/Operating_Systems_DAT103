#!/bin/bash

if [ $# -eq 0 ]
then
	echo "Programmet ble kjørt uten argumenter."
elif [ $# -eq 1 ]
then
	echo "Programmet ble kjørt med ett argument som er $1."
else
	echo "Argumentene gitt til programmet er: $@."
fi
