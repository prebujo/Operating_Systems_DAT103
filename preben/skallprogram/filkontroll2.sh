#!/bin/bash

if (( $# != 2 )); then
    echo "feil antall args"
    exit 1
fi

declare FILNAVN=$1
declare -i INT=$2
declare STATE=0

if [ -e $FILNAVN ]; then
    STATE=$(stat -c %Y $FILNAVN)
fi

declare NEW_STATE=$STATE

while ((1))
do
    sleep $INT
    if [ -e $FILNAVN ]; then
	NEW_STATE=$(stat -c %Y $FILNAVN)
    else
	NEW_STATE=0
    fi
    if(($NEW_STATE != $STATE)); then
	if(( $STATE == 0)); then
	    echo "Filen $FILNAVN ble opprettet"
	elif(( $NEW_STATE == 0)); then
	    echo "Filen $FILNAVN ble slettet"
	else
	    echo "Filen $FILNAVN ble endret"
	fi
	exit 0
    fi
done

	     
	
	
	
      
      
